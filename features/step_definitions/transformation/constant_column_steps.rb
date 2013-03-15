When /^I create a Transformation::ConstantColumn object with "([^"]*)" => "([^"]*)"$/ do |column, value|
  @constant_column = Itiel::Transform::ConstantColumn.new({ column => value })
end
