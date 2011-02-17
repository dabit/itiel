require File.expand_path("#{File.dirname(__FILE__)}/../test_helper.rb")

describe Itiel::Job do
  describe "Itiel::Job#run" do
    it "yields a new instance of Itiel::Job" do
      Itiel::Job.run {|object| assert_instance_of(Itiel::Job, object)}
    end
  end

  describe "Itiel::Job#define" do
    it "returns an instance of Itiel::Job" do
      assert_instance_of Itiel::Job, Itiel::Job.define
    end

    it "yields a new instance of Itiel::Job" do
      Itiel::Job.define {|object| assert_instance_of(Itiel::Job, object)}
    end

    it "sets given block as the block attribute of the instance it returns" do
      block = Proc.new {}
      job   = Itiel::Job.define(&block)
      assert_equal block, job.block
    end
  end

  describe "#run!" do
    it "calls the block on self.block" do
      block = Proc.new {}
      block.expects(:call)
      job = Itiel::Job.define(&block)
      job.run!
    end

    it "responds to step inside the block" do
      @object = mock()
      instanced_job = Itiel::Job.define do |job|
        job.step @object
      end

      instanced_job.expects(:step).with(@object)
      instanced_job.run!
    end
  end

  describe "#step" do
    before :each do
      @job = Itiel::Job.new
      @source = mock()
      @destination = mock()
      @stream = mock()
      @source.expects(:output).at_least_once.returns(@stream)
      @destination.expects(:input=).with(@stream).once
    end

    describe "@source => @destination" do
      it "hardwires the @destinaion's input with the @source output" do
        @job.step @source => @destination
      end
    end

    describe "step @source; step @destination" do
      it "hardwires the @destinaion's input with the @source output" do
        @destination.expects(:output)
        @job.step @source
        @job.step @destination
      end
    end

    describe "step @source => [ @destination, @second_destination ]" do
      it "hardwires both destination's inputs with the @source output" do
        @second_destination = mock()
        @second_destination.expects(:input=).with(@stream).once

        @job.step @source => [@destination, @second_destination]
      end
    end
  end
end
