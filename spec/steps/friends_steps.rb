step "I navigate to friends" do
  visit friends_path
end

step "I add the other user as a friend" do
  @full_name = @other_user.decorate.full_name
  page.fill_in 'autocomplete-friends', with: @full_name
  find("[rel~=submit-friend]").click
end

step "I should see that user is now a friend" do
  expect(page).to have_content(I18n.t('friend.success', friend: @full_name))
end
