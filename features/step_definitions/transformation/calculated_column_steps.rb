Given /^I create a Transformation::CalculatedColumn object that multiplies "([^"]*)" times (\d+)$/ do |column_name, times|
  @calculated_column = Itiel::Transform::CalculatedColumn.new 'new_id' do |columns|
    columns['id'].to_i * 3
  end
end
