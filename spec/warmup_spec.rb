require 'warmup'

describe Warmup do

let(:warm){ Warmup.new }

  describe '#gets_shout' do

    it 'Returns a string' do
      allow(warm).to receive(:gets).and_return("bark")
      expect(warm).to receive(:gets_shout).and_return("BARK")
      warm.gets_shout
    end

  end

  describe '#triple_size' do

    it "returns an array's length times 3" do
      array_double = double(:size => 3)
      expect(warm.triple_size(array_double)).to eq(9)
    end

  end

  describe '#calls_some_methods' do

    let(:string_double) { double(:upcase! => "BARK!", :empty? => false, :reverse! => "!KRAB") }

    it "calls the upcase! method" do
      # string = "bark"
      expect(string_double).to receive(:upcase!)
      warm.calls_some_methods(string_double)
    end

    it "calls the reverse! method" do
      allow(string_double).to receive(:upcase!).and_return(string_double)
      expect(string_double).to receive(:reverse!)
      warm.calls_some_methods(string_double)
    end

    it "returns a different object than the one you passed in" do
      double_id = string_double.object_id
      expect(warm.calls_some_methods(string_double).object_id ).not_to eq(double_id)
    end

  end

end
