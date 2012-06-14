require_relative '../lib/operator'

describe Operator do
  it 'sends each letter of the message to the machine' do
    machine = double(:machine)
    operator = Operator.new(machine)

    machine.should_receive(:call).with('E')
    operator.code_message('E')
  end

  it 'returns the sent message with a machine that does no encode' do

    machine = lambda { |c| c }
    operator = Operator.new(machine)

    operator.code_message('THISISAMESSAGE').should == 'THISISAMESSAGE'
  end
end
