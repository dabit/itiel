require 'spec_helper'

describe Itiel::Load::DatabaseTable do
  before(:each) do
    @output = Itiel::Load::DatabaseTable.new :test, "users"
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
    table = double
    allow(@output).to receive(:table).and_return table

    @input.each do |row|
      expect(table).to receive(:insert).and_return row
    end

    @output.persist(@input)
  end
end

