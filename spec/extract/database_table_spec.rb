require 'spec_helper'

describe Itiel::Extract::DatabaseTable do
  before :each do
    @step            = Itiel::Extract::DatabaseTable.new
    @step.connection = :test
    @step.table_name = 'table_name'
  end

  describe "#extract" do
    it "returns all the rows in the specified database table" do
      result = double
      db = { table_name: result }
      allow(result).to receive(:all).and_return double
      expect(Itiel::Extract::DatabaseTable).
          to receive(:sequel_connection).
          with(:test).and_return db

      expect(@step.extract).to eq result.all
    end
  end
end
