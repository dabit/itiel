require File.expand_path("#{File.dirname(__FILE__)}/../test_helper")

describe Itiel::Source do
  it "responds to :config_file_path" do
    assert_equal true, Itiel::Source.respond_to?(:config_file_path)
  end
end
