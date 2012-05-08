When /^I create a Itiel::Extractor::CustomSQL object with the query:$/ do |string|
  @custom_sql = Itiel::Extractor::CustomSQL.new string
  Itiel::Extractor::CustomSQL.connection_file_path = @database_config_path
  @custom_sql.connection = :test
  @extraction = @custom_sql.extract
end
