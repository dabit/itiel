describe Itiel::Loader::CSVFile do
  before :each do
    @filename = File.expand_path("#{File.dirname(__FILE__)}/../../../tmp/output.csv")
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

		@csv_output = Itiel::Loader::CSVFile.new(@filename)
  end

	describe "the file does not exist" do
		before :each do
			@csv_output.input = @input
			@result           = CSV.read(@filename, :headers => true)
		end

		it "generates a CSV file with the input data" do
			assert_equal @expected_result, @result.to_a
		end

		it "bypasses input to output" do
			assert_equal @input, @csv_output.output
		end
	end

	describe "the file already exists" do
		before :each do
			FileUtils.touch(@filename)
			@csv_output.input = @input
			@result           = CSV.read(@filename)
		end

		it "does not write the headers" do
			assert_equal @expected_result - [[ "id", "name" ]], @result
		end
	end
end
