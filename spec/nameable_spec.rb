require 'spec_helper'

describe Itiel::Nameable do
  before :each do
    step_class = Class.new do
      include Itiel::Nameable
    end

    @step = step_class.new
  end

  it "responds to name= and name" do
    expect(@step).to respond_to :step_name
    expect(@step).to respond_to :step_name=
  end
end

