require 'spec_helper'

describe Level do

  before do
    @level_low = Level.new(description: "NISKI", value: "20")
    @level_high = Level.new(description: "WYSOKI", value: "50")
  end

#  let(:level_low) { FactoryGirl.create(:level_low) }
#  let(:level_high) { FactoryGirl.create(:level_high) }

  subject { @level_high }

  it { should respond_to(:description) }
  it { should respond_to(:value) }
  
  
  it { should be_valid }
  
  describe "when value is not present" do
    before { @level_high.value = nil }
    it { should_not be_valid }
  end
  
  describe "with blank description" do
    before { @level_high.description = " " }
    it { should_not be_valid }
  end
  
  describe "with wrong value" do
    before { @level_high.value = "atsddf" }
    it { should_not be_valid }
  end
  
end