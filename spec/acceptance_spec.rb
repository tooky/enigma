require 'spec_helper'
describe 'Acceptance test' do
  context 'Settings on form' do
    let(:rotor_mechanism) {
      RotorMechanism.new Rotor::I.at('M'), Rotor::II.at('C'), Rotor::III.at('K')
    }

    let(:machine) { Machine.new rotor_mechanism }

    let(:operator) { Operator.new(machine) }

    it 'encodes E as Q' do
      operator.code_message('E').should == 'Q'
    end

    it 'encodes Q as E' do
      operator.code_message('Q').should == 'E'
    end

    it 'can decode and reencode the test message' do
      encoded = "QMJIDOMZWZJFJR"
      decoded = operator.code_message(encoded)

      operator.reset_machine

      operator.code_message(decoded).should == encoded
    end

    it 'decodes a message' do
      encoded = "QMJIDOMZWZJFJR"
      operator.code_message(encoded).should == "ENIGMAREVEALED"
    end
  end
end
