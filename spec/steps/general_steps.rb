step "I am a user" do
  @user = FactoryGirl.create(:user)
end

step "there is another user" do
  @other_user = FactoryGirl.create(:user)
end

step "I am logged in" do
  visit root_path
  page.fill_in 'session_email', with: @user.email
  page.fill_in 'session_password', with: @user.password
  page.click_on I18n.t('misc.log_in')
end
