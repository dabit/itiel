require 'spec_helper'

describe Itiel::DB::SQLConnectable do
  before :each do
    class Step
      include Itiel::DB::SQLConnectable
    end
  end

  it "sets and gets connection_file_path" do
    expect(Step).to respond_to :connection_file_path
    expect(Step).to respond_to :connection_file_path=
  end

  it "returns a sequel_connection object based on the connection file" do
    Step.connection_file_path = File.dirname(__FILE__) + '/../support/config/database.yml'
    expect(Step.sequel_connection(:test)).to_not be_nil
  end
end

