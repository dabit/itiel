When /^I create a Transformation::ConstantColumn object with "([^"]*)" => "([^"]*)"$/ do |column, value|
  @constant_column = Itiel::Transformation::ConstantColumn.new({ column => value })
end
