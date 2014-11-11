step "I am a user" do
  @user = FactoryGirl.create(:user)
end

step "there is another user" do
  @other_user = FactoryGirl.create(:user)
end

step "I am logged in" do
  visit root_path
  page.fill_in 'email', with: @user.email
  page.fill_in 'password', with: @user.password
  page.click_on "Log In"
end
