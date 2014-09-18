require 'spec_helper'
# Run the generator again with the --webrat flag if you want to use webrat methods/matchers

describe "StaticPages" do
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  subject { page }

  describe "Home page" do
    before(:each) { visit root_path }

    #it "should have content 'Sample App'" do
    #expect(page).to have_content('Sample App')
      #response.status.should be(200)
    #end
    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('Home') }
  end

  describe "Help page" do
    before(:each) { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end
  
  describe "About page" do
    before(:each) { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title("About")) }
  end

  describe 'Contact Page' do
    before(:each) { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title("Contact")) }
  end

end
