When /^I create a Itiel::Extract::CustomSQL object with the query:$/ do |string|
  @custom_sql = Itiel::Extract::CustomSQL.new string
  Itiel::Extract::CustomSQL.connection_file_path = @database_config_path
  @custom_sql.connection = :test
  @extraction = @custom_sql.extract
end
