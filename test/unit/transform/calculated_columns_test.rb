require 'test_helper'

describe Itiel::Transform::CalculatedColumns do
  before(:each) do
    @transformer = Itiel::Transform::CalculatedColumns.new do |row|
      total = row['price'] * row['quantity']
      tax   = total * 0.2
      { 'total' => total, 'tax' => tax }
    end

    @transformer.next_step = mock

    @input = [
        { "id" => 1 , "price" => 1.5 , "quantity" => 5 },
        { "id" => 2 , "price" => 3   , "quantity" => 9 },
        { "id" => 3 , "price" => 4.5 , "quantity" => 3 }
    ]
  end

  it "raises an exception when it's not defined" do
    @transformer.next_step = nil

    assert_raises RuntimeError do
      @transformer.transform!(@input)
    end
  end

  it "creates new columns and calculate to fill it" do
    expected_result = [
        { "id" => 1 , "price" => 1.5 , "quantity" => 5 , "total" => 7.5,  "tax" => 1.5 },
        { "id" => 2 , "price" => 3   , "quantity" => 9 , "total" => 27,   "tax" => 5.4 },
        { "id" => 3 , "price" => 4.5 , "quantity" => 3 , "total" => 13.5, "tax" => 2.7 }
    ]

    assert_equal expected_result, @transformer.transform!(@input)
  end
end
