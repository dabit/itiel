require File.expand_path("#{File.dirname(__FILE__)}/../test_helper.rb")

describe Itiel::Job do
  describe "Itiel::Job#run" do
    it "yields a new instance of Itiel::Job" do
      Itiel::Job.run {|object| assert_instance_of(Itiel::Job, object)}
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
