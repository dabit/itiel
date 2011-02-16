require File.expand_path("#{File.dirname(__FILE__)}/../../test_helper.rb")

describe Itiel::Transformations::SingleColumnSort do
  before :each do
    @sorted_z_to_a = [
				{ "id" => 1, "name" => "Zeta"  },
				{ "id" => 2, "name" => "Omega" },
				{ "id" => 3, "name" => "Alpha" }
    ]

    @sorted_a_to_z = [
				{ "id" => 3, "name" => "Alpha" },
				{ "id" => 2, "name" => "Omega" },
				{ "id" => 1, "name" => "Zeta"  }
    ]
  end

  describe "no order given" do
    before :each do
      @transformation = Itiel::Transformations::SingleColumnSort.new("name")
      @transformation.input = @sorted_z_to_a
    end

    it "returns the stream sorted by name, ascending" do
      assert_equal @sorted_a_to_z, @transformation.output
    end
  end

  describe "ascending order" do
    before :each do
      @transformation = Itiel::Transformations::SingleColumnSort.new("name", :desc)
      @transformation.input = @sorted_z_to_a
    end

    it "returns the stream sorted by name, descending" do
      assert_equal @sorted_z_to_a, @transformation.output
    end
  end

  describe "invalid sort order given" do
    it "raises an exception" do
      assert_raises RuntimeError do
        Itiel::Transformations::SingleColumnSort.new("name", :xyz)
      end
    end
  end
end
