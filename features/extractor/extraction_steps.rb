Then /^the extraction for that object should have (\d+) rows?$/ do |count|
  @extraction.count.should == count.to_i
end
