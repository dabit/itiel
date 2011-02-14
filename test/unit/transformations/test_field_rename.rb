require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Transformations::FieldRename do
  before :each do
    @transformer = Itiel::Transformations::FieldRename.new("order_id" => "id", "name" => "client_name")
    @transformer.input = [
        {"order_id" => 1, "name" => "bucket", "price" => 1.5},
        {"order_id" => 2, "name" => "second bucket", "price" => 3}
    ]

    @transformer.transform!

    @result = @transformer.output
  end

  it "renames the elements in the input hash" do
    expected_result = [
        {"id" => 1, "client_name" => "bucket", "price" => 1.5},
        {"id" => 2, "client_name" => "second bucket", "price" => 3}
    ]

    assert_equal expected_result, @result
  end
end
