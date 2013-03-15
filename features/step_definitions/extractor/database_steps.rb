Given /^an? (.+) database table with rows:$/ do |table_name, table|
  step "a #{table_name} database table"

  rows = Itiel::Extract::CustomSQL.sequel_connection(:test)[:blogposts]
  table.hashes.each do |row|
    rows.insert row
  end
end

Given /^an? blogpost database table$/ do
  Itiel::Extract::CustomSQL.connection_file_path = @database_config_path

  Itiel::Extract::CustomSQL.sequel_connection(:test).create_table :blogposts do
    Integer :id
    String :title
    String :author
  end
end
