require File.expand_path("#{File.dirname(__FILE__)}/../test_helper")

class SomeDataSource < Itiel::Source

end

describe Itiel::Source do
  it "responds to :config_file_path" do
    assert_equal true, Itiel::Source.respond_to?(:config_file_path)
  end

  it "has a default value of config" do
    assert_equal 'config/sources', Itiel::Source.config_file_path
  end

  it "stores the new value on config_file_path" do
    Itiel::Source.config_file_path = 'new_path'
    assert_equal 'new_path', Itiel::Source.config_file_path
    Itiel::Source.config_file_path = 'config/sources'
  end

  it "creates the config file name from the name of the class" do
    assert_equal 'some_data_sources', SomeDataSource.config_section
  end
end
