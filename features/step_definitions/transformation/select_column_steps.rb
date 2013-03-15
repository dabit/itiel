Given /^I create a Transformation::SelectColumn object with "([^"]*)" and "([^"]*)"$/ do |column1, column2|
  @select_column = Itiel::Transform::SelectColumn.new column1, column2
end
