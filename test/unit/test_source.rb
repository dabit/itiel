require File.expand_path("#{File.dirname(__FILE__)}/../test_helper")

describe Itiel::Source do
  it "responds to :config_file_path" do
    assert_equal Itiel::Source.respond_to?(:config_file_path), true
  end

  it "has a default value of config" do
    assert_equal Itiel::Source.config_file_path, 'config'
  end

  it "stores the new value on config_file_path" do
    Itiel::Source.config_file_path = 'new_path'
    assert_equal Itiel::Source.config_file_path, 'new_path'
  end
end
