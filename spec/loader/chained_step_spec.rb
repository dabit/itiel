require 'spec_helper'

describe Itiel::Load::ChainedStep do
  before :each do
    klass = Class.new
    klass.send :include, Itiel::Load::ChainedStep

    @step = klass.new
  end

  it "defines next_step" do
    expect(@step).to respond_to(:next_step)
    expect(@step).to respond_to(:next_step=)
  end

  describe :persist do
    it "raises an error if undefined" do
      expect { @step.persist([]) }.to raise_error Itiel::MethodNotImplementedException
    end
  end

  describe :input= do
    before :each do
      @next_step      = double
      @input          = [ double ]
      @step.next_step = @next_step

      expect(Itiel::Logger).to receive(:log_received).with(@step, @input.size)
      expect(Itiel::Logger).to receive(:log_processed).with(@step, @input.size)
    end

    it "calls persist with the stream received through input= and sends it to next_step" do
      expect(@step).to receive(:persist).with @input
      expect(@next_step).to receive(:input=).with @input
      @step.input = @input
    end
  end
end

