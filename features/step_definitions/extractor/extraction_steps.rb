Then /^the extraction for that object should have (\d+) rows?$/ do |count|
  expect(@extraction.count).to eq count.to_i
end
