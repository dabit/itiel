Given /^I create a Transformation::MapValues object for the state column to integer$/ do
  @map_values = Itiel::Transformation::MapValues.new(
      { "state" => { "active" => 1, "inactive" => 0 }})
end
