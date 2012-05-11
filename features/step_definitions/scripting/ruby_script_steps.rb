Given /^I create a Itiel::Scripting::RubyScript object with the following block of code:$/ do |script|
  @ruby_script = Itiel::Scripting::RubyScript.new do |row|
    instance_eval script
  end
end
