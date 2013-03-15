require 'test_helper'

describe Itiel::Extract::CustomSQL do
  describe "#extract" do
    before :each do

      @step = Itiel::Extract::CustomSQL.new 'SCRIPT'
      @step.connection = :test
    end

    it "Runs a script on the database and returns its results to the stream" do
      result = mock
      stub(result).all.stub!
      db = { 'SCRIPT' => result }
      stub(Itiel::Extract::CustomSQL).sequel_connection(:test).returns db

      assert_equal @step.extract, result.all
    end
  end
end
