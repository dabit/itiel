require 'test_helper'

describe Itiel::Scripting::SQLScript do
  before :each do
    @sql_script = Itiel::Scripting::SQLScript.new("DELETE FROM orders")
    @data_stream = { "c" => "v" }
  end

  describe :sanity_check do
    describe "no connection specified" do
      it "raises RuntimeError" do
        assert_raises RuntimeError do
          @sql_script.sanity_check
        end
      end
    end

    describe "connection is not Itiel::DB::Connection" do
      before :each do
        @sql_script.connection = Object.new
      end

      it "raises RuntimeError" do
        assert_raises RuntimeError do
          @sql_script.sanity_check
        end
      end
    end

    describe "No SQL sentence is given" do
      before :each do
        @sql_script.connection = Itiel::DB::Connection.new
        @sql_script.sql = nil
      end

      it "raises RuntimeError" do
        assert_raises RuntimeError do
          @sql_script.sanity_check
        end
      end
    end
  end

  describe :execute do
    before :each do
      @connection = mock
      stub(@sql_script).sanity_check
      stub(@sql_script).connection.stub!.connection_string.stub!
      stub(@sql_script).sql.stub!
    end

    it "Executes the specified SQL script with the given connection" do
      mock(@sql_script.class::Executor).establish_connection @sql_script.connection.connection_string
      mock(@sql_script.class::Executor).connection.mock!.execute @sql_script.sql
      mock(@sql_script.class::Executor).clear_all_connections!

      @sql_script.execute
    end
  end
end
