When /^I create a Loader::CSVFile object with "([^"]*)"$/ do |filename|
  @destination = Itiel::Loader::CSVFile.new(File.join('tmp', filename), false)
end

