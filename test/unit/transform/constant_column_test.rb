require 'test_helper'

describe Itiel::Transform::ConstantColumn do
  before :each do
    @input = [
      	{ "id" => "1" },
      	{ "id" => "2" }
    ]

    @expected_output = [
      	{ "id"     => "1", "append" => "value" },
      	{ "id"     => "2", "append" => "value" }
    ]

    @transformation = Itiel::Transform::ConstantColumn.new("append" => "value")
  end

  it "appends a field with a constant value to the stream" do
    assert_equal @expected_output, @transformation.transform!(@input)
  end
end
