require 'spec_helper'

describe Question do

  before do
    # This code is not idiomatically correct.
    @question = Question.new(description: "czy ma rozum?", strength:5)
  end

  subject { @question }

  it { should respond_to(:description) }
  it { should respond_to(:cancelled) }
  it { should respond_to(:strength) }
  
  it { should be_valid }
  
  
  describe "when user_id is not present" do
    before { @question.description = nil }
    it { should_not be_valid }
  end
  
end