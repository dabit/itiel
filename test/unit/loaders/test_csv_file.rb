describe Itiel::Loaders::CSVFile do
  before :each do
    @filename = File.expand_path("#{File.dirname(__FILE__)}/../../../tmp/output.csv")

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
        ["id" , "name"        ] ,
        ["1"  , "Subject Name"] ,
        ["2"  , "Subject Name"]
    ]

    @csv_output = Itiel::Loaders::CSVFile.new(@filename)
    @csv_output.input = @input

    File.exist?(@filename)
    @result = CSV.read(@filename, :headers => true)
  end

  it "generates a CSV file with the input data" do
    assert_equal @expected_result, @result.to_a
  end

  it "wires input to output" do
    assert_equal @input, @csv_output.output
  end
end
