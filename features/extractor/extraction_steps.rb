Then /^the extraction for that object should have (\d+) row$/ do |count|
  @extraction.count.should == count.to_i
end
