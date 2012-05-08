require 'test_helper'

describe Itiel::Extractor::CustomSQL do
  describe "#extract" do
    before :each do

      @step = Itiel::Extractor::CustomSQL.new 'SCRIPT'
      @step.connection = :test
    end

    it "Runs a script on the database and returns its results to the stream" do
      result = mock
      stub(result).all.stub!
      db = { 'SCRIPT' => result }
      stub(Itiel::Extractor::CustomSQL).sequel_connection(:test).returns db

      assert_equal @step.extract, result.all
    end
  end
end
