require 'spec_helper'

describe Itiel::Script::SQLScript do
  before :each do
    @sql_script = Itiel::Script::SQLScript.new("DELETE FROM orders")
    @data_stream = { "c" => "v" }
  end

  describe :sanity_check do
    describe "no connection specified" do
      it "raises RuntimeError" do
        expect { @sql_script.sanity_check }.to raise_error
      end
    end

    describe "connection is not Itiel::DB::Connection" do
      before :each do
        @sql_script.connection = Object.new
      end

      it "raises RuntimeError" do
        expect { @sql_script.sanity_check }.to raise_error
      end
    end

    describe "No SQL sentence is given" do
      before :each do
        @sql_script.connection = Itiel::DB::Connection.new
        @sql_script.sql = nil
      end

      it "raises RuntimeError" do
        expect { @sql_script.sanity_check }.to raise_error
      end
    end
  end

  describe :execute do
    before :each do
      @connection = double(connection_string: double)
      allow(@sql_script).to receive(:sanity_check)
      allow(@sql_script).to receive(:connection).and_return @connection
      allow(@sql_script).to receive(:sql).and_return double
    end

    it "Executes the specified SQL script with the given connection" do
      expect(@sql_script.class::Executor).to receive(:establish_connection).
          with @sql_script.connection.connection_string

      expect(@connection).to receive(:execute).with(@sql_script.sql)
      expect(@sql_script.class::Executor).to receive(:connection).
          and_return @connection
      expect(@sql_script.class::Executor).to receive :clear_all_connections!

      @sql_script.execute
    end
  end
end

