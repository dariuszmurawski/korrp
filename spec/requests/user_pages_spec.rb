require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Zarejestruj się') }
    it { should have_title(full_title('Rejestracja')) }
  end
end