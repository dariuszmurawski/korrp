require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end



  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Rejestracja') }
    it { should have_title(full_title('Rejestracja')) }
  end
  
  
  
  
   describe "signup" do

    before { visit signup_path }

    let(:submit) { "Utwórz konto" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "imię i nazwisko",         with: "Example User"
        fill_in "adres e-mial",        with: "user@example.com"
        fill_in "hasło" ,     with: "foobar"
        fill_in "Potwierdzenie hasła", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  
  
  
  
  
  
  
  
  
  
  
  
end