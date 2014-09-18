require 'spec_helper'
# Run the generator again with the --webrat flag if you want to use webrat methods/matchers

describe "StaticPages" do
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}

  describe "Home page" do
    it "should have content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
      #response.status.should be(200)
    end

    it "should have the base title" do
      visit root_path
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end

    it "should not have custom page title" do
      visit root_path
      expect(page).not_to have_title('Home')
    end
    

  end

  describe "Help page" do
    it "should contain the text 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have title that includes 'Help'" do
      visit help_path
      expect(page).to have_title("#{base_title} | Help")
    end
  end
  
  describe "About page" do
    it "should have content 'About'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have title that includes 'About'" do
      visit about_path
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe 'Contact Page' do
    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have 'Contact' in the title" do
      visit contact_path
      expect(page).to have_title("#{base_title} | Contact")
    end
  end

end
