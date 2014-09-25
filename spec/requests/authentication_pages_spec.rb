require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Logowanie') }
    it { should have_title('Logowanie') }
  end
  
  
  
  
  
   describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Zaloguj" }

      it { should have_title('Logowanie') }
      it { should have_selector('div.alert.alert-error') }
      
       describe "after visiting another page" do
        before { click_link "Strona Startowa" }
        it { should_not have_selector('div.alert.alert-error') }
       end

    end
    
     describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "adres e-mail",    with: user.email.upcase
        fill_in "hasło", with: user.password
        click_button "Zaloguj"
      end

      it { should have_title(user.name) }
      it { should have_link('Profil',     href: user_path(user)) }
      it { should have_link('Wyloguj',    href: signout_path) }
      it { should_not have_link('Zaloguj', href: signin_path) }
      
      
      describe "followed by signout" do
        before { click_link "Wyloguj" }
        it { should have_link('Zaloguj') }
      end
      
    end

    
    
  end

  
  
end
