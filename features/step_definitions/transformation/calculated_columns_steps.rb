Given /^I create a Transformation::CalculatedColumns object$/ do
  @calculated_columns = Itiel::Transform::CalculatedColumns.new do |row|
     name_state = "#{row['name']}-#{row['state']}"
     id_name    = "#{row['id']}-#{row['name']}"
     { 'name_state' => name_state, 'id_name' => id_name }
  end
end
