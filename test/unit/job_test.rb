require 'test_helper'

describe Itiel::Job do
  describe "#run" do
    it "yields a new instance of Itiel::Job" do
      Itiel::Job.run {|object| assert_instance_of(Itiel::Job, object)}
    end
  end

  describe "#define" do
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
      mock(block).call(is_a(Itiel::Job))
      job = Itiel::Job.define(&block)
      job.run!
    end

    it "responds to step inside the block" do
      @object = mock()
      instanced_job = Itiel::Job.define do |job|
        job.step @object
      end

      mock(instanced_job).step(@object)
      instanced_job.run!
    end
  end

  describe "#step" do
    before :each do
      @job = Itiel::Job.new
      @source = mock()
      @destination = mock()
      @stream = mock()
      stub(@source).output { @stream }
      mock(@destination).input=(@stream)
    end

    describe "@source => @destination" do
      it "hardwires the @destination's input with the @source output" do
        @job.step @source => @destination
      end
    end

    describe "step @source; step @destination" do
      it "hardwires the @destination's input with the @source output" do
        mock(@destination).output
        @job.step @source
        @job.step @destination
      end
    end

    describe "step @source => [ @destination, @second_destination ]" do
      it "hardwires both destination's inputs with the @source output" do
        @second_destination = mock()
        mock(@second_destination).input=(@stream)

        @job.step @source => [@destination, @second_destination]
      end
    end
  end
end
