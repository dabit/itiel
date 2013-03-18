When /^I create a Itiel::Extract::DatabaseTable object for the 'blogposts' table$/ do
  @database_table = Itiel::Extract::DatabaseTable.new
  @database_table.connection = :test
  @database_table.table_name = 'blogposts'
  @source ||= @database_table

  @extraction = @database_table.extract
end
