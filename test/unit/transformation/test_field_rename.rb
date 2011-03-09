require 'test_helper'

describe Itiel::Transformation::FieldRename do
  before :each do
    @transformer = Itiel::Transformation::FieldRename.new(
        "order_id" => "id",
        "name" => "client_name"
    )

    @input = [
        { "order_id" => 1 , "name" => "bucket"        , "price" => 1.5 },
        { "order_id" => 2 , "name" => "second bucket" , "price" => 3   }
    ]
  end

  it "renames the elements in the input hash" do
    expected_result = [
        { "id" => 1 , "client_name" => "bucket"        , "price" => 1.5 },
        { "id" => 2 , "client_name" => "second bucket" , "price" => 3   }
    ]

    assert_equal expected_result, @transformer.transform!(@input)
  end
end
