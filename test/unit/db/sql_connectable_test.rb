require 'test_helper'

describe Itiel::DB::SQLConnectable do
  before :each do
    class Step
      include Itiel::DB::SQLConnectable
    end
  end

  it "sets and gets connection_file_path" do
    assert_respond_to Step, :connection_file_path
    assert_respond_to Step, :connection_file_path=
  end

  it "returns a sequel_connection object based on the connection file" do
    Step.connection_file_path = File.dirname(__FILE__) + '/../../support/config/database.yml'
    refute_nil Step.sequel_connection(:test)
  end
end
