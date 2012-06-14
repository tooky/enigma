require_relative '../lib/machine'

describe Machine do
  context 'encoding/decoding a character' do
    let(:rotor_mechanism) { double(:rotors).as_null_object }
    let(:reflector) { double(:reflector).as_null_object }
    let(:machine) { Machine.new(rotor_mechanism, reflector) }

    it 'returns the coded character' do
      rotor_mechanism.stub(:input).with(4) { 5 }
      reflector.stub(:reflect).with(5) { 6 }
      rotor_mechanism.stub(:output).with(6) { 8 }

      machine.call('E').should == 'I'
    end
  end
end
