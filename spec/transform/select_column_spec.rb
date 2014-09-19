require 'spec_helper'

describe Itiel::Transform::SelectColumn do
  before :each do
    @transformer = Itiel::Transform::SelectColumn.new("order_id", "name")
    @input = [
         { "order_id" => 1 , "name" => "bucket"        , "price" => 1.5 },
         { "order_id" => 2 , "name" => "second bucket" , "price" => 3   }
    ]
  end

  it "returns only specified fields" do
    expected_result = [
        {"order_id" => 1, "name" => "bucket"        } ,
        {"order_id" => 2, "name" => "second bucket" }
    ]

    expect(@transformer.transform!(@input)).to eq expected_result
  end
end

