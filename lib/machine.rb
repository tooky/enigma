class Machine
  attr_reader :rotor_mechanism, :reflector
  def initialize(rotor_mechanism, reflector=Reflector.new)
    @rotor_mechanism = rotor_mechanism
    @reflector = reflector
  end

  def call(char)
    start_index = ('A'..'Z').to_a.index(char)
    input_index = rotor_mechanism.input(start_index)
    reflected_index = reflector.reflect(input_index)
    output_index = rotor_mechanism.output(reflected_index)
    ('A'..'Z').to_a[output_index]
  end

  def reset
  end
end
