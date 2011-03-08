describe Itiel::Extractor::CSVFile do
  before :each do
    csv_filename = "#{File.dirname(__FILE__)}/../../../tmp/test_file.csv"

    CSV.open(csv_filename, "wb") do |csv|
      csv << ["id"]
      30.times do |i|
        csv << [i]
      end
    end

    @csv_file = Itiel::Extractor::CSVFile.new(csv_filename)
    @csv_file.batch_size = 15
  end

  it "sets it's output as the next step's input" do
    @next_step = mock
    @next_step.expects(:input=).twice.with { |value| value.is_a?(Array) && value.length == 15 }.returns(true)
    @csv_file.next_step = @next_step
    @csv_file.start
  end
end

