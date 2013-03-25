require 'test_helper'

describe Itiel::Lookup::HashLookup do
  before(:each) do
    @input = [
      {
        :id     => 1,
        :author => "Isaac"
      },
      {
        :id     => 2,
        :author => "Carver"
      }
    ]

    @lookup_source = [
      {
        :id     => 1,
        :name   => "Isaac",
        :active => "t"
      },
      {
        :id     => 2,
        :name   => "Carver",
        :active => "f"
        }
    ]

    @lookup_stream = {
      "Isaac" => {
        :author_id => 1,
        :active    => "t"
      },

      "Carver" => {
        :author_id => 2,
        :active    => "f"
      }
    }

    @expected_output = [
      {
        :id        => 1,
        :author    => "Isaac",
        :author_id => 1,
        :active    => "t"
      },
      {
        :id        => 2,
        :author    => "Carver",
        :author_id => 2,
        :active    => "f"
      }
    ]

    class FooLookup
      include Itiel::Lookup::HashLookup
    end

    @lookup = FooLookup.new
    @lookup.lookup_columns = { "author" => "name" }
    @lookup.joined_columns = { "id" => "author_id", "active" => "active" }
  end

  describe "#lookup!" do
    it "joins the data using the specified column" do
      stub(@lookup).lookup_stream { @lookup_stream }
      assert_equal @expected_output, @lookup.lookup!(@input)
    end
  end

  describe "#lookup_stream" do
    it do
      stub(@lookup).lookup_source { @lookup_source }
      assert_equal @lookup_stream, @lookup.lookup_stream
    end
  end

  describe 'with nil values in the lookup column' do
    before do
      @input.append({ id: 3, author: nil })
      @expected_output.append({ id: 3, author: nil })
    end

    describe "#lookup!" do
      it 'joins the data setting the value to nil' do
        stub(@lookup).lookup_stream { @lookup_stream }
        assert_equal @expected_output, @lookup.lookup!(@input)
      end
    end
  end

  describe "When the lookup column doesn't exist in the input_stream" do
    before do
      @input.append({ id: 3 })
      @expected_output.append({ id: 3, author: nil })
    end

    describe "#lookup!" do
      it 'joins the data setting the value to nil' do
        stub(@lookup).lookup_stream { @lookup_stream }
        assert_equal @expected_output, @lookup.lookup!(@input)
      end
    end
  end
end
