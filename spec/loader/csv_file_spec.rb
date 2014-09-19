require 'spec_helper'

describe Itiel::Load::CSVFile do
  before :each do
    @filename = File.expand_path("#{File.dirname(__FILE__)}/../../tmp/output.csv")
    File.unlink(@filename) if File.exist?(@filename)

    @input = [
        {
          "id"   => 1,
          "name" => "Subject Name"
        },
        {
          "id"   => 2,
          "name" => "Subject Name"
        }
    ]

    @expected_result = [
        [ "id" , "name"         ] ,
        [ "1"  , "Subject Name" ] ,
        [ "2"  , "Subject Name" ]
    ]

    @csv_output = Itiel::Load::CSVFile.new(@filename)
  end

  describe "the file does not exist" do
    before :each do
      @csv_output.persist(@input)
      @result = CSV.read(@filename, :headers => true)
    end

    it "generates a CSV file with the input data" do
      expect(@expected_result).to eq @result.to_a
    end
  end

  describe "the file already exists" do
    before :each do
      FileUtils.touch(@filename)
      @csv_output.persist(@input)
      @result = CSV.read(@filename)
    end

    it "appends to the existing data" do
      expect(@expected_result - [[ "id", "name" ]]).to eq @result
    end
  end

  describe "use append = false" do
    before do
      @csv_output = Itiel::Load::CSVFile.new(@filename, false)
    end

    describe "the file already exists" do
      before :each do
        FileUtils.touch(@filename)
        @csv_output.persist(@input)
        @result = CSV.read(@filename)
      end

      it "replaces the existing file with the input data" do
        expect(@expected_result).to eq @result
      end
    end
  end
end

