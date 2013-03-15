When /^I create a Transformation::SingleColumnSort object by "([^"]*)"$/ do |column_name|
  @single_column_sort = Itiel::Transform::SingleColumnSort.new column_name
end
