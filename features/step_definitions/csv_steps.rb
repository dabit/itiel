Given /^a "([^"]*)" file with the following rows:$/ do |filename, table|
  CSV.open File.join('tmp', filename), "wb" do |csv|
    table.raw.each { |row| csv << row }
  end
end

Then /^the "([^"]*)" file should exist with the following content:$/ do |filename, table|
  expected_file = CSV.generate do |csv|
    table.raw.each { |row| csv << row }
  end

  resulting_file = File.new(File.join('tmp', filename), "rb").read

  expect(resulting_file).to eq expected_file
end
