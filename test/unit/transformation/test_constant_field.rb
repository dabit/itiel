describe Itiel::Transformation::ConstantField do
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

    @transformation       = Itiel::Transformation::ConstantField.new("append" => "value")
  end

  describe "transform!" do
    it "appends a field with a constant value to the stream" do
      assert_equal @expected_output, @transformation.transform!(@input)
    end
  end
end
