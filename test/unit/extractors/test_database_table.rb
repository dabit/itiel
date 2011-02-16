require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Extractors::DatabaseTable do
  before :each do
    @legacy_orders_source           = Legacy::Orders.new(legacy_connection)
    @legacy_orders_source.step_name = "Load orders from Legacy"

    Legacy::Orders::Model.create(:order_id => 1)
    Legacy::Orders::Model.create(:order_id => 2)

    @results = @legacy_orders_source.output
  end

  after :each do
    Legacy::Orders::Model.delete_all
  end

  it "has a given name" do
    assert_equal "Load orders from Legacy", @legacy_orders_source.step_name
  end

  it "returns 2 objects" do
    assert_equal 2, @results.size
  end

  it "returns an array of hashes" do
    assert_equal Array, @results.class
    @results.each do |result|
      assert_equal Hash, result.class
    end
  end
end
