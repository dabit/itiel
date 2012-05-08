require 'test_helper'

describe Itiel::Extractor::DatabaseTable do
  before :each do
    @step            = Itiel::Extractor::DatabaseTable.new
    @step.connection = :test
    @step.table_name = 'table_name'
  end

  describe "#extract" do
    it "returns all the rows in the specified database table" do
      result = mock
      db = { :table_name => result }
      stub(result).all.stub!
      mock(Itiel::Extractor::DatabaseTable).sequel_connection(:test) { db }

      assert_equal @step.extract, result.all
    end
  end
end
