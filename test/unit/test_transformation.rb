require File.expand_path("#{File.dirname(__FILE__)}/../test_helper")

describe Itiel::Transformation do
	it "transforms!" do
		TransformProducts.new.transform!
	end
end
