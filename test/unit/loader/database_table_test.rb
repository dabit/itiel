require 'test_helper'

describe Itiel::Loader::DatabaseTable do
  before(:each) do
    @output = Itiel::Loader::DatabaseTable.new :test, "users"
    @input = [
        {
          "id"   => "1",
          "name" => "Some Name"
        },
        {
          "id"   => "2",
          "name" => "Some Other Name"
        },
    ]
  end

  it "inserts a record for each row" do
    table = mock
    stub(@output).table { table }

  	@input.each do |row|
  		mock(table).insert row
  	end

    @output.persist(@input)
  end
end
