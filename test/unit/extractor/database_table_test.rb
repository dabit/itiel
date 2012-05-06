require 'test_helper'

describe Itiel::Extractor::DatabaseTable do
  before :each do
    Itiel::Extractor::DatabaseTable.connection_file_path = File.dirname(__FILE__) + '/../../support/config/database.yml'

    @extractor            = Itiel::Extractor::DatabaseTable.new
    @extractor.connection = :test
    @extractor.table_name = 'test_table'

    db = Itiel::Extractor::DatabaseTable.sequel_connection(:test)
    db.run("CREATE TABLE #{@extractor.table_name} (name TEXT)")

    10.times do |i|
      db[@extractor.table_name.to_sym].insert(:name => "name #{i}")
    end
  end

  it "returns the contents of the table in batches" do
    @extractor.batch_size = 5
    @extractor.in_batches do |rows|
      assert_instance_of Array, rows
      assert_equal 5, rows.size
    end
  end

  after :each do
    File.unlink('test.db') if File.exist?('test.db')
  end
end
