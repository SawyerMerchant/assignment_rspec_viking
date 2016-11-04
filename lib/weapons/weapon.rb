class Weapon
  attr_reader :name
  # attr_accessor :multiplier

  def initialize(name, multiplier = 1)
    @name = name
    @multiplier = multiplier
  end

  def use
    @multiplier
  end

end