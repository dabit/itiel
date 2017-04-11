Given /^the following data is in the stream:$/ do |table|
  @stream = table.hashes
end

Then /^the resulting output stream should be:$/ do |table|
  output = @ruby_script.execute(@stream)
  expect(output).to eq table.hashes
end
