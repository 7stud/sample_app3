require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "Sign Up page" do
    before(:each) { visit signup_path }
    it { should have_content("Sign Up") }
    it { should have_title(full_title("Sign Up")) }
  end

end
