When /^I create a Itiel::Extractor::DatabaseTable object for the 'blogposts' table$/ do
  @database_table = Itiel::Extractor::DatabaseTable.new
  @database_table.connection = :test
  @database_table.table_name = 'blogposts'

  @extraction = @database_table.extract
end
