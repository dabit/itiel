require 'test_helper'

describe Itiel::Nameable do
	before :each do
		class Step
			include Itiel::Nameable
		end

		@step = Step.new
	end

	it "responds to name= and name" do
		assert_respond_to @step, :step_name
		assert_respond_to @step, :step_name=
	end
end
