Given /^I create a Itiel::Script::RubyScript object with the following block of code:$/ do |script|
  @ruby_script = Itiel::Script::RubyScript.new do |row|
    instance_eval script
  end
end
