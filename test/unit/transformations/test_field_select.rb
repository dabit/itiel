require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Transformations::FieldSelect do
  before :each do
    @transformer = Itiel::Transformations::FieldSelect.new("order_id", "name")
    @transformer.input = [
        {"order_id" => 1, "name" => "bucket", "price" => 1.5},
        {"order_id" => 2, "name" => "second bucket", "price" => 3}
    ]

    @result = @transformer.output
  end

  it "returns only specified fields" do
    expected_result = [
        {"order_id" => 1, "name" => "bucket"},
        {"order_id" => 2, "name" => "second bucket"}
    ]

    assert_equal expected_result, @result
  end
end
