describe Itiel::Transformation::CalculatedField do
  before(:each) do
    @transformer = Itiel::Transformation::CalculatedField.new "total" do |fields|
      fields['price'] * fields['quantity']
    end
    @transformer.input = [
        {"id" => 1, "price" => 1.5, "quantity" => 5},
        {"id" => 2, "price" => 3, "quantity" => 9},
        {"id" => 3, "price" => 4.5, "quantity" => 3}
    ]
    @result = @transformer.output
  end
  
  it "create a new field and calculate to fill it" do
    expected_result = [
        {"id" => 1, "price" => 1.5, "quantity" => 5, "total" => 7.5},
        {"id" => 2, "price" => 3, "quantity" => 9, "total" => 27},
        {"id" => 3, "price" => 4.5, "quantity" => 3, "total" => 13.5}
    ]
    assert_equal expected_result, @result
  end
end
