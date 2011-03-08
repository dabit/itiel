describe Itiel::Loader::DatabaseTable do
  before(:each) do
    @output = Destination::ShippedOrders.new(destination_connection)
    @input = [
				{
					"id"   => "1",
					"name" => "Some Name"
				},
				{
					"id"   => "2",
					"name" => "Some Other Name"
				},
    ]

		@output.input = @input
    @results = Destination::ShippedOrders::Model.all
  end

  after(:each) do
    Destination::ShippedOrders::Model.delete_all
  end

  it "stores the input on the specified table" do
    assert_equal 2, @results.size
  end

  it "creates a record for each row" do
    @input.each do |row|
      result = Destination::ShippedOrders::Model.where(:name => row["name"]).first
      assert_equal row["name"], result.name
    end
  end

  it "wires input to output" do
    assert_equal @input, @output.output
  end
end
