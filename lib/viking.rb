require_relative 'weapons/axe'
require_relative 'weapons/bow'
require_relative 'weapons/fists'

class Viking
  attr_reader :health, :strength, :name, :weapon

  def initialize(args={})
    @name = args[:name] || "RandomViking"
    @health = args[:health] || 100
    @strength = args[:strength] || 10
    @fists = Fists.new
    @weapon = args[:weapon]
  end
  # def initialize(name="RandomViking", health = 100, strength = 10, weapon = nil)
  #   @name = name
  #   @health = health
  #   @strength = strength
  #   @fists = Fists.new
  #   @weapon = weapon
  # end


  def attack(target)
    puts "#{name} is attacking #{target.name}!"
    target.receive_attack(damage_dealt)
  end

  def receive_attack(damage_dealt)
    take_damage(damage_dealt)
    puts "#{name} took #{damage_dealt} damage and has #{health} health..."
  end

  def pick_up_weapon(weapon)
    raise "Can't pick up that thing" unless weapon.is_a?(Weapon)
    @weapon = weapon
  end

  def drop_weapon
    @weapon = nil
  end

  private
  def damage_dealt
    if @weapon
      damage_with_weapon
    else
      damage_with_fists
    end
  end

  def damage_with_weapon
    begin
      @weapon.use * @strength
    rescue Exception => e
      puts "You could not use your weapon because #{e.message}"
      damage_with_fists
    end
  end

  def damage_with_fists
    @fists.use * @strength
  end

  def take_damage(damage)
    #binding.pry
    @health -= damage
    check_death
    @health
  end

  def check_death
    raise "#{self.name} has Died..." if @health <= 0
  end

end

# Run script
# oleg = Viking.new(name: "Oleg")
# sven = Viking.new(name: "Sven")
# oleg.attack(sven)
# oleg.pick_up_weapon(Bow.new(2))
# 3.times { oleg.attack(sven) }
# sven.attack(oleg)
# sven.pick_up_weapon(Axe.new)
# 3.times {sven.attack(oleg)}
# puts "\nInspecting vikings:\n"
# puts oleg.inspect
# puts sven.inspect
# puts "\n...thanks for playing.\n\n"
# olg = Viking.new
# merf = Viking.new(name: 'Merf')
# olg.attack(merf)
