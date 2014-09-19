require 'spec_helper'

describe Itiel::Transform::RenameColumn do
  before :each do
    @transformer = Itiel::Transform::RenameColumn.new(
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

    expect(@transformer.transform!(@input)).to eq expected_result
  end
end

