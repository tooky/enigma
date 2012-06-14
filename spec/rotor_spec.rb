require_relative '../lib/rotor'

describe Rotor do
  context "with no offset" do
    let(:rotor) { Rotor::I }

    it "output maps index from left to right" do
      rotor.output(0).should == 20
      rotor.output(1).should == 22
      rotor.output(2).should == 24
      rotor.output(3).should == 6
    end

    it "input maps index from right to left" do
      rotor.input(20).should == 0
      rotor.input(22).should == 1
      rotor.input(24).should == 2
      rotor.input(6).should == 3
    end
  end

  context "with offset of 1" do
    let(:rotor) { Rotor::I.at('B') }

    it "output maps index from left to right" do
      rotor.output(0).should == 21
      rotor.output(1).should == 23
      rotor.output(2).should == 5
      rotor.output(3).should == 25
    end

    it "input maps index from right to left" do
      rotor.input(21).should == 0
      rotor.input(23).should == 1
      rotor.input(5).should == 2
      rotor.input(25).should == 3
    end
  end

end
