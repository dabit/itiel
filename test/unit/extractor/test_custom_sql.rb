require 'test_helper'

describe Itiel::Extractor::CustomSQL do
  before :each do
    @connection_string = 'sqlite://test.db'

    @db = Sequel.connect(@connection_string)
    @db.run("CREATE TABLE t (id PRIMARY_KEY, name TEXT)")
    table = @db[:t]

    50.times do |i|
      table.insert(:name => "name #{i}")
    end

    @custom_sql = Itiel::Extractor::CustomSQL.new
    @custom_sql.connection_string = 'sqlite://test.db'
  end

  after :each do
    File.unlink('test.db')
  end

  it "returns the result of the query in batches" do
    @custom_sql.connection_string = @connection_string
    @custom_sql.script = 'SELECT * FROM t'
    @custom_sql.batch_size = 10
    @custom_sql.in_batches do |y|
      assert_equal Array, y.class
      assert_equal 10, y.length
    end
  end
end
