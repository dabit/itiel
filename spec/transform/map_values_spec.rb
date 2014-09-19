require 'spec_helper'

describe Itiel::Transform::MapValues do
  before :each do
    @input = [
      { "id" => 1 , "active" => true  } ,
      { "id" => 2 , "active" => false }
    ]

    @output = [
      { "id" => 1 , "active" => "yes" } ,
      { "id" => 2 , "active" => "no"  }
    ]

    @transformation = Itiel::Transform::MapValues.new(
      {
        "active" => { true => "yes", false => "no" }
      }
    )
  end

  it "maps a column depending on it's value" do
    expect(@output).to eq @transformation.transform!(@input)
  end
end

