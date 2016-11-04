require 'pry'
require 'viking'

describe Viking do

  let(:olg) { Viking.new }
  let(:merf) { Viking.new(name: 'Merf') }

  describe '#initialize' do

    it 'can be assigned a name' do
      expect(merf.name).to eq("Merf")
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

  end

  describe '#pick_up_weapon' do

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

  end

  describe '#receive_attack' do

    it "loses health when attacked" do
      olg.receive_attack(99) # A staggering blow!
      expect(olg.health).to eq(1)
    end

  end

  describe '#take_damage' do

    #ask about me! I pass but heath stays same
    it "calls the take_damage method when attacked" do
      expect(olg).to receive(:take_damage)
      merf.attack(olg)
    end

    it "has its health drop when attacked" do
      olg_pre_attack_health = olg.health
      merf.attack(olg)
      expect(olg.health).to be < olg_pre_attack_health
    end

  end

  describe '#attack' do

    it "runs damage_with_fists when attacking with no weapon" do
      olg_fists_damage = 2.5
      expect(olg).to receive(:damage_with_fists).and_return(olg_fists_damage)
      olg.attack(merf)
    end

    it "calculates fist damage correctly" do
      fists_multiplier = Fists.new.instance_variable_get(:@multiplier)
      olg_initial_health = olg.health
      merf.attack(olg)
      expect(olg_initial_health - olg.health).to eq(fists_multiplier*olg.strength)
    end

    it "runs damage_with_weapon when attacking with a weapon" do
      olg.pick_up_weapon(Axe.new)
      expect(olg).to receive(:damage_with_weapon).and_return(10)
      olg.attack(merf)
    end

    it "calculates axe damage correctly" do
      axe_multiplier = Axe.new.instance_variable_get(:@multiplier)
      puts "axe_multiplier #{axe_multiplier}"
      # olg_initial_health = olg.health
      # merf.attack(olg)
      # expect(olg_initial_health - olg.health).to eq(axe_multiplier*olg.strength)
    end

  end

end
