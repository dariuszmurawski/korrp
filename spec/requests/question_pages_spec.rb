require 'spec_helper'

describe "Question pages" do
  
  subject { page }
  
  let(:admin) { FactoryGirl.create(:admin) }
  before { sign_in admin}
  
  
  describe "show page" do
    let!(:q1) { FactoryGirl.create(:question, description: "pytanie 1", strength: 1) }
    let!(:q2) { FactoryGirl.create(:question, description: "pytanie 2", strength: 2) }
    before { visit questions_path }
    
    it { should have_content("Kryteria - rodzaje analizowanych informacji") }
    it { should have_title("Kryteria - rodzaje analizowanych informacji") }
    
    describe "questions" do
      it { should have_content(q1.description) }
      it { should have_content(q2.description) }
  #    it { should have_content(Questions.count) }
    end

    
  end
  
  
  
end