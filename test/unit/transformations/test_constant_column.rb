require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Transformations::ConstantField do
  before :each do
    @input = [
      {
        "id" => "1"
      },
      {
        "id" => "2"
      }
    ]

    @expected_output = [
      {
        "id"     => "1",
        "append" => "value"
      },
      {
        "id"     => "2",
        "append" => "value"
      }
    ]

    @transformation       = Itiel::Transformations::ConstantField.new("append" => "value")
    @transformation.input = @input
    @result               = @transformation.output
  end

  it "appends a field with a constant value to the stream" do
    assert_equal @expected_output, @result
  end
end
