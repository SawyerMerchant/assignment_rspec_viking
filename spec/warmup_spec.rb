require 'warmup'

describe Warmup do

  describe '#gets_shout' do

    it 'Returns a string' do
      warm = Warmup.new
      allow(warm).to receive(:gets).and_return(str)
      expect().to eq(0)
    end
  end
end