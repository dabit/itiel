When /^I create a Loader::CSVFile object with "([^"]*)"$/ do |filename|
  @destination = Itiel::Load::CSVFile.new(File.join('tmp', filename), false)
end

