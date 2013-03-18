When /^I create a Itiel::Extract::DatabaseTable object for the '(.*?)' table$/ do |table_name|
  @database_table = Itiel::Extract::DatabaseTable.new
  @database_table.connection = :test
  @database_table.table_name = table_name
  @source ||= @database_table

  @extraction = @database_table.extract
end
