require 'spec_helper'

describe Itiel::Job do
  describe "#run" do
    it "yields a new instance of Itiel::Job" do
      Itiel::Job.run { |object| expect(object).to be_instance_of(Itiel::Job) }
    end
  end

  describe "#define" do
    it "returns an instance of Itiel::Job" do
      expect(Itiel::Job.define).to be_instance_of(Itiel::Job)
    end

    it "yields a new instance of Itiel::Job" do
      Itiel::Job.define {|object| assert_instance_of(Itiel::Job, object)}
    end

    it "sets given block as the block attribute of the instance it returns" do
      block = Proc.new {}
      job   = Itiel::Job.define(&block)
      expect(block).to eq job.block
    end
  end

  describe "#run!" do
    it "calls the block on self.block" do
      block = Proc.new {}
      expect(block).to receive(:call)
      job = Itiel::Job.define(&block)
      job.run!
    end

    it "responds to step inside the block" do
      @object = double
      instanced_job = Itiel::Job.define do |job|
        job.step @object
      end

      expect(instanced_job).to receive(:step).with(@object)
      instanced_job.run!
    end
  end

  describe "#step" do
    before :each do
      @job         = Itiel::Job.new
      @source      = double
      @destination = double
      @stream      = double

      allow(@source).to receive(:output).and_return @stream
      expect(@destination).to receive(:input=).and_return @stream
    end

    describe "@source => @destination" do
      it "hardwires the @destination's input with the @source output" do
        @job.step @source => @destination
      end
    end

    describe "step @source; step @destination" do
      it "hardwires the @destination's input with the @source output" do
        expect(@destination).to receive(:output)
        @job.step @source
        @job.step @destination
      end
    end

    describe "step @source => [ @destination, @second_destination ]" do
      it "hardwires both destination's inputs with the @source output" do
        @second_destination = double
        expect(@second_destination).to receive(:input=).and_return @stream

        @job.step @source => [@destination, @second_destination]
      end
    end
  end
end

