require File.expand_path("#{File.dirname(__FILE__)}/../test_helper")

class Legacy < Itiel::DataSource

end

describe Itiel::DataSource do
  it "responds to :config_file_path" do
    assert_equal true, Itiel::DataSource.respond_to?(:config_file_path)
  end

  it "has a default value of config" do
    assert_equal 'config/sources', Itiel::DataSource.config_file_path
  end

  it "stores the new value on config_file_path" do
    Itiel::DataSource.config_file_path = 'new_path'
    assert_equal 'new_path', Itiel::DataSource.config_file_path
    Itiel::DataSource.config_file_path = 'config/sources'
  end

  it "creates the config file name from the name of the class" do
    assert_equal 'legacy', Legacy.config_section
  end
end
