require 'spec_helper'

describe Itiel::Extract::CustomSQL do
  describe "#extract" do
    before :each do
      @step = Itiel::Extract::CustomSQL.new 'SCRIPT'
      @step.connection = :test
    end

    it "Runs a script on the database and returns its results to the stream" do
      result = double
      allow(result).to receive(:all).and_return double
      db = { 'SCRIPT' => result }
      allow(Itiel::Extract::CustomSQL).to receive(:sequel_connection).with(:test).and_return db

      expect(@step.extract).to eq result.all
    end
  end
end
