When /^I create a Extractor::CSVFile object with "([^"]*)"$/ do |filename|
  @source = Itiel::Extractor::CSVFile.new File.join("tmp", filename)
end
