Given /^I create a Transformation::RenameColumn object from "([^"]*)" to "([^"]*)"$/ do |original_name, new_name|
  @field_rename = Itiel::Transformation::RenameColumn.new({ original_name => new_name })
end
