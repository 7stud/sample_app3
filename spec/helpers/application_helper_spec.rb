require 'spec_helper'

describe "full_title() helper" do
  it "should return the correct page title" do
    expect(full_title('foo')).to match(/foo/)
  end

  it "should return the correct base title" do
    expect(full_title('foo')).to match(/^Ruby on Rails Tutorial Sample App/)
  end

  it "should not return a bar for a blank custom title" do
    expect(full_title('')).not_to match(/\|/)
  end
end
