require 'spec_helper'

describe Itiel::Script::SQLScript do
  before :each do
    @sql_script = Itiel::Script::SQLScript.new("DELETE FROM orders")
    @data_stream = { "c" => "v" }
  end

  describe :sanity_check do
    describe "no connection specified" do
      it "raises Itiel::MissingConnection" do
        expect { @sql_script.sanity_check }.to raise_error Itiel::MissingConnection
      end
    end

    describe "No SQL sentence is given" do
      before :each do
        @sql_script.connection = Itiel::DB::Connection.new
        @sql_script.sql = nil
      end

      it "raises Itiel::SQLSentenceNotProvided" do
        expect { @sql_script.sanity_check }.to raise_error Itiel::SQLSentenceNotProvided
      end
    end
  end

  describe :execute do
    before :each do
      @connection = double
      @sql_script.connection = :test
      allow(Itiel::Script::SQLScript).to receive(:sequel_connection).with(:test).and_return @connection
      #allow(@sql_script).to receive(:sanity_check)
      #allow(@sql_script).to receive(:sql).and_return double
    end

    it "Executes the specified SQL script with the given connection" do
      expect(@connection).to receive(:<<).with(@sql_script.sql)
      @sql_script.execute
    end
  end
end

