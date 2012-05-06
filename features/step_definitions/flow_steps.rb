When /^the data flows in the following direction:$/ do |table|
  last_step = nil

  table.raw.each do |step|
    instance_eval "#{last_step}.next_step = #{step.first}" if last_step
    last_step = step.first
  end
end

When /^I start the source$/ do
  @source.start
end
