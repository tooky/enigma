require_relative '../lib/operator'

describe Operator do
  it 'returns the sent message with a machine that does no encode' do

    machine = lambda { |c| c }
    operator = Operator.new(machine)

    operator.code_message('THISISAMESSAGE').should == 'THISISAMESSAGE'
  end
end
