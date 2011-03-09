describe Itiel::Scripting::SQLScript do
  before :each do
    @sql_script = Itiel::Scripting::SQLScript.new("DELETE FROM orders")
    @data_stream = { "c" => "v" }
  end

  describe "no connection specified" do
    it "raises RuntimeError" do
      assert_raises RuntimeError do
        @sql_script.input = @data_stream
      end
    end
  end

  describe "connection is not Itiel::DB::Connection" do
    before :each do
      @sql_script.connection = Object.new
    end

    it "raises RuntimeError" do
      assert_raises RuntimeError do
        @sql_script.input = @data_stream
      end
    end
  end

  describe "a connection is set" do
    before :each do
      @sql_script.connection = legacy_connection
      @sql_script.next_step = mock(:input=)
    end

    it "executes the sql script" do
      @sql_script.input = @data_stream
      # No idea how to test the execution of the script
      # I need better ActiveRecord handling?
    end
  end
end
