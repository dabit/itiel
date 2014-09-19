require 'spec_helper'

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
      	expect { @step.input = [] }.to raise_error
      end
    end

    describe "class does not implement execute" do
      before :each do
        @step.next_step = double
      end

      it  "raises an excepiton if the class does not implement execute" do
        expect { @step.expect }.to raise_error
      end
    end
  end

  describe :input= do
    before :each do
      allow(@step).to receive(:sanity_check)
      @input_stream = double
      allow(@step).to receive(:next_step).and_return double
    end

    it "executes with input stream, sets output as next_step input" do
      allow(@step).to receive(:execute).with(@input_stream)
      allow(@step.next_step).to receive(:input=).with(@input_stream)
      #mock(@step.next_step).input=(@input_stream)
      @step.input = @input_stream
    end
  end
end

