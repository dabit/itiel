Given /^a blogpost database table with rows:$/ do |table|
  Itiel::Extractor::CustomSQL.connection_file_path = @database_config_path

  Itiel::Extractor::CustomSQL.sequel_connection(:test).create_table :blogposts do
  	Integer :id
  	String :title
  	String :author
  end

  blogposts = Itiel::Extractor::CustomSQL.sequel_connection(:test)[:blogposts]
  table.hashes.each do |row|
    blogposts.insert row
  end
end
