require 'viking'

describe Viking do

  let(:olg) { Viking.new }

  describe '#initialize' do

    it 'can be assigned a name' do
      olg2 = Viking.new(name: "Olg")
      expect(olg2.name).to eq("Olg")
    end

    it 'can be assigned a health value' do
      expect(Viking.new(health: 3).health).to eq(3)
    end

    it 'cannot have its health overridden' do
      expect{olg.health = 10}.to raise_error(NoMethodError)
    end

    it 'has no weapon by default' do
      expect(olg.weapon).to eq(nil)
    end

    it "sets a Viking's weapon when picked up" do
      olg.pick_up_weapon(Bow.new)
      expect(olg.weapon).to be_a(Bow)
    end

    it "raises an exception when it picks up a non-weapon" do
      expect { olg.pick_up_weapon(Viking.new) }.to raise_error("Can't pick up that thing")
    end

    it "picking up a new weapon replaces its existing weapon" do
      olg.pick_up_weapon(Bow.new)
      expect(olg.weapon).to be_a(Bow)
      olg.pick_up_weapon(Axe.new)
      expect(olg.weapon).to be_a(Axe)
    end

    it "sets Viking's weapon to nil when dropped" do
      olg.pick_up_weapon(Bow.new)
      expect(olg.weapon).to be_a(Bow)
      olg.drop_weapon
      expect(olg.weapon).to eq(nil)
    end

    it "loses health when attacked" do
      olg.receive_attack(99) # A staggering blow!
      expect(olg.health).to eq(1)
    end



  end

end
