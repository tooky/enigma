class Operator
  attr_reader :machine
  def initialize(machine)
    @machine = machine
  end

  def code_message(message)
    output = message.scan(/./).map { |c| machine.call(c) }
    output.join
  end

  def reset_machine

  end
end
