require 'spec_helper'
describe 'Acceptance test' do
  context 'Settings on form' do
    let(:machine) { Machine.new Rotor::I.at('M'), Rotor::II.at('C'), Rotor::III.at('K') }

    let(:operator) { Operator.new(machine) }

    it 'encodes E as Q' do
      operator.code_message('E').should == 'Q'
    end

    it 'encodes Q as E' do
      operator.code_message('Q').should == 'E'
    end

    it 'can decode and reencode the test message' do
      encoded = "QMJIDO MZWZJFJR"
      decoded = operator.code_message(encoded.scan(/./))

      operator.reset_machine

      operator.code_message(decoded.scan(/./)).should == encoded
    end
  end
end
