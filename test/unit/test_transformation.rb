require File.expand_path("#{File.dirname(__FILE__)}/../test_helper")

describe Itiel::Transformation do
  before :each do
    @legacy_values = [1 ,2]
    @legacy_values.each do |value|
      Legacy::Order.create(:order_id => value)
    end
    @result = TransformOrders.new.transform!
  end

  after :each do
    Legacy::Order.delete_all
    NewHome::Order.delete_all
  end

  it "transforms 2 orders" do
    assert_equal 2, @result.size
  end

  it "returns NewHome::Order objects" do
    @result.each do |r|
      assert_equal NewHome::Order, r.class
    end
  end

  it "maps the old id to the new ids" do
    assert_equal @result.collect(&:id), @legacy_values
  end
end
