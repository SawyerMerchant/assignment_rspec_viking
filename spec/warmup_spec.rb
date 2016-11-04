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
      warm_double = double
    end

  end

end
