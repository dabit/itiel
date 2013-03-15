require 'test_helper'

describe Itiel::Script::ChainedStep do
  before :each do
    klass = Class.new
    klass.send :include, Itiel::Script::ChainedStep

    @step = klass.new
  end

  describe :sanity_check do
    describe "next_step is undefined" do
      before :each do
        @step.next_step = nil
      end

      it "raises an exception" do
        assert_raises RuntimeError do
          @step.input = []
        end
      end
    end

    describe "class does not implement execute" do
      before :each do
        @step.next_step = mock
      end

      it  "raises an excepiton if the class does not implement execute" do
        assert_raises RuntimeError do
          @step.execute
        end
      end
    end
  end

  describe :input= do
    before :each do
      stub(@step).sanity_check
      @input_stream = mock
      stub(@step).next_step.stub!
    end

    it "executes with input stream, sets output as next_step input" do
      mock(@step).execute(@input_stream)
    	mock(@step.next_step).input=(@input_stream)
  		@step.input = @input_stream
    end
  end
end
