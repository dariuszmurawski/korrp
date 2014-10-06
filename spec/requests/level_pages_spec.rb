require 'spec_helper'

describe "Question pages" do
  
  subject { page }
  
  
  
  describe "no admin sign in show level" do
    before { visit levels_path }
    
    it { should_not have_content("Przedziały punktowe ryzyka") }
    it { should_not have_title("Przedziały punktowe ryzyka") } 
     
  end
  
  
  
  
  describe "show page" do
    
    let(:admin) { FactoryGirl.create(:admin) }
    let!(:levellow) { FactoryGirl.create(:level, description: "NISKI", value: 20) }
    let!(:levelhigh) { FactoryGirl.create(:level,description: "WYSOKI", value: 50) }
  
    before do 
       sign_in admin
       visit levels_path
    end
    
    it { should have_content("Przedziały punktowe ryzyka") }
    it { should have_title("Przedziały punktowe ryzyka") }
    
    it { should have_content(levellow.description) }
    it { should have_content(levelhigh.description) }
    
  end
  
  describe "edit page" do
    let(:admin) { FactoryGirl.create(:admin) }
    let!(:levellow) { FactoryGirl.create(:level, description: "NISKI", value: 20) }
    let!(:levelhigh) { FactoryGirl.create(:level,description: "WYSOKI", value: 50) }
    
    describe "no sign admin edit" do
      before do
        visit edit_level_path(levellow)
      end
      
      it { should_not have_content("Edycja przedziału punktowego ryzyka") }
      it { should_not have_title("Edycja przedziału punktowego ryzyka") }
    end
    
    describe "admin edit" do
      before do
        sign_in admin
        visit edit_level_path(levellow)        
      end
      
      it { should have_content("Edycja przedziału punktowego ryzyka") }
      it { should have_title("Edycja przedziału punktowego ryzyka") }
      
      
      describe "with invalid information" do
        let(:new_value)  { "sdfsfs" }
        before do
            fill_in "wartość",             with: new_value
            click_button "Akceptuj zmiany"
        end
        it { should have_selector('div.alert.alert-error') }
      end
    
    
    
      describe "with valid information" do
        let(:new_value)  { 38 }
        before do
            fill_in "wartość",             with: new_value
            click_button "Akceptuj zmiany"
        end
        it { should have_selector('div.alert.alert-success') }  
        it { should have_content(new_value) }   
        specify { expect(levellow.reload.value).to  eq new_value }   
      end
      
            
    end
       
  end
  
end