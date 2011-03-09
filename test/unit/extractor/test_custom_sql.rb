require 'test_helper'

describe Itiel::Extractor::CustomSQL do
  before :each do
    Itiel::Extractor::CustomSQL.connection_file_path = File.dirname(__FILE__) + '/../../support/config/database.yml'

    @db = Itiel::Extractor::CustomSQL.sequel_connection(:test)
    @db.run("CREATE TABLE t (id PRIMARY_KEY, name TEXT)")
    table = @db[:t]

    50.times do |i|
      table.insert(:name => "name #{i}")
    end

    @custom_sql = Itiel::Extractor::CustomSQL.new
    @custom_sql.connection = :test
  end

  after :each do
    File.unlink('test.db') if File.exists?('test.db')
  end

  it "returns the result of the query in batches" do
    @custom_sql.script = 'SELECT * FROM t'
    @custom_sql.batch_size = 10
    @custom_sql.in_batches do |y|
      assert_equal Array, y.class
      assert_equal 10, y.length
    end
  end

  it "sets and gets connection_file_path" do
    assert_respond_to Itiel::Extractor::CustomSQL, :connection_file_path
    assert_respond_to Itiel::Extractor::CustomSQL, :connection_file_path=
  end
end
