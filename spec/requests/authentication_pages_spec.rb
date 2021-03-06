require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }    
  end

  describe "signin" do
    before { visit signin_path }    

    describe "with valid information" do
      let(:user) { User.create(name: "Gadget Manager Nuno Pato", email: "nunopato@applift.com",
                               password: "mygadget", password_confirmation: "mygadget") }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      
    end
  end

end