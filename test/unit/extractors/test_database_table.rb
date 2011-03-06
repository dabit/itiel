describe Itiel::Extractors::DatabaseTable do
  before :each do
    @legacy_orders_source           = Legacy::Orders.new(legacy_connection)
    @legacy_orders_source.step_name = "Load orders from Legacy"
  end

  after :each do
    Legacy::Orders::Model.delete_all
  end

  it "has a given name" do
    assert_equal "Load orders from Legacy", @legacy_orders_source.step_name
  end

  it "set it's output as the next step input" do
    # Set the batch size to 30
    @legacy_orders_source.batch_size = 15

    # Create 30 rows
    30.times do |i|
      Legacy::Orders::Model.create(:order_id => i)
    end

    # Mock the receiver
    @next_step = mock

    # Should send two batches of 15 elements
    @next_step.expects(:input=).with {|value| value.is_a?(Array) && value.size == 15}.twice
    @legacy_orders_source.next_step = @next_step

    # Go!
    @legacy_orders_source.start
  end
end
