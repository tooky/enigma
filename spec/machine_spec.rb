require_relative '../lib/machine'

describe Machine do
  context 'encoding/decoding a character' do
    let(:rotor_mechanism) { double(:rotors).as_null_object }
    let(:reflector) { double(:reflector).as_null_object }
    let(:machine) { Machine.new(rotor_mechanism, reflector) }

    it 'returns the coded character' do
      rotor_mechanism.stub(:input => 4)
      reflector.stub(:reflect => 6)
      rotor_mechanism.stub(:output => 8)

      machine.call('I')
    end

    it 'inputs the index of the alphabet character to the rotor mechanism' do
      ('A'..'Z').each_with_index do |c,index|
        rotor_mechanism.should_receive(:input).with(index)
        machine.call(c)
      end
    end

    it 'reflects the index from the input to the rotors' do
      rotor_mechanism.stub(:input => 4)
      reflector.should_receive(:reflect).with(4)
      machine.call('E')
    end

    it 'passes the reflected index back to the rotor mechanism' do
      rotor_mechanism.stub(:input => 4)
      reflector.stub(:reflect => 6)
      rotor_mechanism.should_receive(:output).with(6)
      machine.call('E')
    end
  end
end
