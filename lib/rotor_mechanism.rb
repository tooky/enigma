class RotorMechanism
  attr_reader :rotors

  def initialize(*rotors)
    @rotors = rotors
  end

  def input(index)
  end

  def output(index)
    rotors.reduce(index) { |memo, rotor| rotor.output(memo) }
  end
end
