Given(/^I create a Itiel::Lookup::DatabaseTable object for the "(.*?)"$/) do |table_name|
  @database_lookup = Itiel::Lookup::DatabaseTable.new
  @database_lookup.connection = :test
  @database_lookup.table_name = table_name
end

Given(/^the lookup joins the "(.*?)" column in the source with the "(.*?)" column in the lookup stream$/) do |source_column, lookup_column|
  @database_lookup.lookup_columns = { source_column => lookup_column }
end

Given(/^the lookup appends the "(.*?)" column on the lookup stream to the source as "(.*?)"$/) do |original_name, new_name|
  @database_lookup.joined_columns = { original_name => new_name }
end

Then(/^the output for the lookup should be:$/) do |table|
  result = @database_lookup.output
  table.hashes.each_with_index do |row, index|
    result[index][:id].should eq row["id"].to_i
    result[index][:title].should eq row["title"]
    result[index][:author].should eq row["author"]
    result[index][:author_id].should eq row["author_id"].to_i
  end
end
