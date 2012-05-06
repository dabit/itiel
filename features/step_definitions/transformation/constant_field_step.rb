When /^I create a Transformation::ConstantField object with "([^"]*)" => "([^"]*)"$/ do |column, value|
  @constant_field = Itiel::Transformation::ConstantField.new({ column => value })
end
