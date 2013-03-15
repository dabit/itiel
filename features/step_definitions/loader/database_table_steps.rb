Given /^I create a Loader::DatabaseTable object for the "([^"]*)" table$/ do |arg1|
  @destination  = Itiel::Load::DatabaseTable.new :test, "blogposts"
end

When /^I load the source into the destination$/ do
  @source >> @destination
  @source.start
end

Then /^the "([^"]*)" table should have (\d+) records$/ do |table_name, record_count|
  Itiel::Extract::CustomSQL.connection_file_path = @database_config_path

  Itiel::Extract::CustomSQL.sequel_connection(:test)[table_name.to_sym].count.should == record_count.to_i
end
