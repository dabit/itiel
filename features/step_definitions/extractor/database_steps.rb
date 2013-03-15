Given /^a blogpost database table with rows:$/ do |table|
  Itiel::Extract::CustomSQL.connection_file_path = @database_config_path

  Itiel::Extract::CustomSQL.sequel_connection(:test).create_table :blogposts do
    Integer :id
    String :title
    String :author
  end

  blogposts = Itiel::Extract::CustomSQL.sequel_connection(:test)[:blogposts]
  table.hashes.each do |row|
    blogposts.insert row
  end
end

Given /^a blogpost database table$/ do
  Itiel::Extract::CustomSQL.connection_file_path = @database_config_path

  Itiel::Extract::CustomSQL.sequel_connection(:test).create_table :blogposts do
    Integer :id
    String :title
    String :author
  end
end
