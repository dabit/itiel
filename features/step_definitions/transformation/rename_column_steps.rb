Given /^I create a Transformation::RenameColumn object from "([^"]*)" to "([^"]*)"$/ do |original_name, new_name|
  @rename_column = Itiel::Transform::RenameColumn.new({ original_name => new_name })
end
