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
  
  
  
  
  describe "index" do
    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
      visit users_path
    end

    it { should have_title('Zarejestrowani użytkownicy') }
    it { should have_content('Zarejestrowani użytkownicy') }

    it "should list each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.name)
      end
    end
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

    describe "after saving the user" do
      before { click_button submit }
      let(:user) { User.find_by(email: 'user@example.com') }

      it { should have_link('Wyloguj') }
      it { should have_title(user.name) }
      it { should have_selector('div.alert.alert-success', text: 'Witamy') }


    end


      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
    
    
    
  end

  
  
  
   describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_content("Modyfikacja danych użytkownika") }
      it { should have_title("Edycja użytkownika") }

    end

    describe "with invalid information" do
      before { click_button "Zapisz zmiany" }

      it { should have_content('błędów') }
    end
    
    
      describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "imię i nazwisko",             with: new_name
        fill_in "adres e-mial",            with: new_email
        fill_in "hasło",         with: user.password
        fill_in "Potwierdzenie hasła", with: user.password
        click_button "Zapisz zmiany"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Wyloguj', href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }

    end
  end

  
  
  
  
  
  
  
  
end