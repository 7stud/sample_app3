require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "Signup page" do
    before(:each) { visit signup_path }

    it { should have_content("Sign Up") }
    it { should have_title(full_title("Sign Up")) }
  end

  describe "signup" do
    before(:each) { visit signup_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",           with: "Example User"
        fill_in "Email",          with: "user@example.com"
        fill_in "Password",       with: "foobar"
        fill_in "Confirmation",   with: "foobar"
      end

      it "should create a new user" do
        expect do
          click_button submit
        end.to change(User, :count).by(1)
      end

    end

    
      
      
  end

  describe 'Profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { visit user_path(user) }

    it { should have_title(user.name) }
    it { should have_content(user.name) }
  end


end
