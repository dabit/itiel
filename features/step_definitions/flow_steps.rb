When /^the data flows in the following direction:$/ do |table|
  last_step = nil

  instance_eval table.raw.flatten.join(" >> ")
end

When /^I start the source$/ do
  @source.start
end
