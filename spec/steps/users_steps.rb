step "I navigate to my profile" do
  visit profile_path
end

step "I submit the profile form" do
  page.fill_in :user_first_name, with: @name = "New Name"
  find("[rel~=submit-user]").click
end

step "I should see my profile has been updated" do
  expect(page).to have_content I18n.t('user.success')
  expect(page).to have_content(@name)
end
