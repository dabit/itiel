require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Outputs::CSVFile do
  before :each do
    @filename = File.expand_path("#{File.dirname(__FILE__)}/../../../tmp/output.csv")
  end

  it "generates a CSV file with the input data" do
    input = [
      {
        "id" => 1,
        "name" => "Subject Name"
      },
      {
        "id" => 2,
        "name" => "Subject Name"
      }
    ]

    expected_result = [
      ["id", "name"],
      ["1", "Subject Name"],
      ["2", "Subject Name"]
    ]
    @csv_output = Itiel::Outputs::CSVFile.new(@filename)
    @csv_output.input = input

    File.exist?(@filename)
    result = CSV.read(@filename, :headers => true)

    assert_equal expected_result, result.to_a
  end
end
