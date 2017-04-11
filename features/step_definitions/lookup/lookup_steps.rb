Given(/^I create a Itiel::Lookup::DatabaseTable object for the "(.*?)"$/) do |table_name|
  @lookup = Itiel::Lookup::DatabaseTable.new
  @lookup.connection = :test
  @lookup.table_name = table_name
end

Given(/^I create a Itiel::Lookup::CSVFile object with the "(.*?)" file$/) do |file_name|
  @lookup = Itiel::Lookup::CSVFile.new(File.join('tmp', file_name))
end

Given(/^the lookup joins the "(.*?)" column in the source with the "(.*?)" column in the lookup stream$/) do |source_column, lookup_column|
  @lookup.lookup_columns = { source_column => lookup_column }
end

Given(/^the lookup appends the "(.*?)" column on the lookup stream to the source as "(.*?)"$/) do |original_name, new_name|
  @lookup.joined_columns = { original_name => new_name }
end

Then(/^the output for the lookup should be:$/) do |table|
  result = @lookup.output
  table.hashes.each_with_index do |row, index|
    table.headers.each do |column|
      expect(result[index][column.to_sym].to_s).to eq row[column]
    end
  end
end

Given /^an? orders database table$/ do
  Itiel::Extract::CustomSQL.connection_file_path = @database_config_path

  Itiel::Extract::CustomSQL.sequel_connection(:test).create_table :orders do
    Integer :id
    String :email
  end
end
