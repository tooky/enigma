require_relative '../lib/reflector'

describe Reflector do
  it 'reflects the input index to the other index for that letter' do
    subject.reflect(0).should == 24
    subject.reflect(24).should == 0

    subject.reflect(1).should == 17
    subject.reflect(17).should == 1
  end
end
