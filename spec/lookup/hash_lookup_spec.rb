require 'spec_helper'

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
      allow(@lookup).to receive(:lookup_stream).and_return @lookup_stream
      expect(@expected_output).to eq @lookup.lookup!(@input)
    end
  end

  describe "#lookup_stream" do
    it do
      allow(@lookup).to receive(:lookup_source).and_return @lookup_source
      expect(@lookup_stream).to eq @lookup.lookup_stream
    end
  end

  describe 'with nil values in the lookup column' do
    before do
      @input.append({ id: 3, author: nil })
      @expected_output.append({ id: 3, author: nil })
    end

    describe "#lookup!" do
      it 'joins the data setting the value to nil' do
        allow(@lookup).to receive(:lookup_stream).and_return @lookup_stream
        expect(@expected_output).to eq @lookup.lookup!(@input)
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
        allow(@lookup).to receive(:lookup_stream).and_return @lookup_stream

        expect(@expected_output).to eq @lookup.lookup!(@input)
      end
    end
  end
end

