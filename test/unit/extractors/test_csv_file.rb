describe Itiel::Extractors::CSVFile do
  before :each do
    csv_filename = "#{File.dirname(__FILE__)}/../../../tmp/test_file.csv"

    lines = []
    30.times do |i|
      lines << [i]
    end

    CSV.open(csv_filename, "wb") do |csv|
      csv << ["id"]
      lines.each do |l|
        csv << l
      end
    end

    @csv_file = Itiel::Extractors::CSVFile.new(csv_filename)
    @csv_file.batch_size = 15
  end

  it "sets it's output as the next step's input" do
    @next_step = mock
    @next_step.expects(:input=).twice.with { |value| value.is_a?(Array) && value.length == 15 }.returns(true)
    @csv_file.next_step = @next_step
    @csv_file.start
  end
end

