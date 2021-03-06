require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "Gadgeter page" do
    let(:user) { User.create(name: "Gadget Manager Nuno Pato", email: "nunopato@applift.com",
                            password: "mygadget", password_confirmation: "mygadget") }

    before { visit user_path(user) }

    it { should have_content(user.name) }    
  end


  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Gadget Manager"
        fill_in "Email",        with: "manager@applift.com"
        fill_in "Password",     with: "gadget"
        fill_in "Confirmation", with: "gadget"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
    
  end
end