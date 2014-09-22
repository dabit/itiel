require 'spec_helper'

describe Itiel::Script::ChainedStep do
  before :each do
    klass = Class.new
    klass.send :include, Itiel::Script::ChainedStep

    @step = klass.new
  end

  describe :input= do
    before :each do
      @input_stream = double
      allow(@step).to receive(:next_step).and_return double
    end

    it "executes with input stream, sets output as next_step input" do
      allow(@step).to receive(:execute).with(@input_stream)
      allow(@step.next_step).to receive(:input=).with(@input_stream)
      @step.input = @input_stream
    end
  end
end

