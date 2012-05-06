Given /^I create a Transformation::FieldRename object from "([^"]*)" to "([^"]*)"$/ do |original_name, new_name|
  @field_rename = Itiel::Transformation::FieldRename.new({ original_name => new_name })
end
