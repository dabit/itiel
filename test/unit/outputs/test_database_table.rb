require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Outputs::DatabaseTable do
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

  it "" do
    @input.each do |row|
      result = Destination::ShippedOrders::Model.where(:name => row["name"]).first
      assert_equal row["name"], result.name
    end
  end
end
