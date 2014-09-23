require 'spec_helper'

describe "Static pages" do


 subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Karta Oceny Ryzyka Rejestracji Podmiotu') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Start') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Pomoc') }
    it { should have_title(full_title('Pomoc')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('Informacje o programie') }
    it { should have_title(full_title('Info')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Kontakt') }
    it { should have_title(full_title('Kontakt')) }
  end
end






