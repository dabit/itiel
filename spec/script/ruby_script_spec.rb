require 'spec_helper'

describe Itiel::Script::RubyScript do
  before :each do
    @step = Itiel::Script::RubyScript.new do |row|
      row["data"] = "bar"
    end
  end

  describe "#execute" do
    it "iterates through the input_stream and yields to given block" do
      stream = [ { "data" => "foo" } ]
      @step.execute(stream)
      expect(stream).to eq [ { "data" => "bar" } ]
    end
  end
end

