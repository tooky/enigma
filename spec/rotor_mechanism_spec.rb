require_relative '../lib/rotor_mechanism'

describe RotorMechanism do
  describe 'mapping the output index from the reflector' do
    it 'maps from 1 => 2 => 3' do
      rotor1 = double(:rotor)
      rotor1.stub(:output).with(9) { 1 }
      rotor2 = double(:rotor)
      rotor2.stub(:output).with(1) { 2 }
      rotor3 = double(:rotor)
      rotor3.stub(:output).with(2) { 3 }

      mechanism = RotorMechanism.new(rotor1, rotor2, rotor3)

      mechanism.output(9).should == 3
    end
  end
end

