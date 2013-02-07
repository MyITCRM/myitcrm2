require 'spec_helper'

describe "UserLogins" do
  it "logs ussr into system" do
    user = Factory(:user)
    visit root_path
    fill_in "Username", :with => user.username
    click_button "Sign In"
  end
end
