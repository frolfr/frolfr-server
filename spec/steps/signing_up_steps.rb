step "I visit the sign up page" do
  visit sign_up_path
end

step "I fill out the sign up form" do
  page.fill_in 'user_email', with: "david@frolfr.com"
  page.fill_in 'user_first_name', with: @first_name = "David"
  page.fill_in 'user_last_name', with: "Bowie"
  page.fill_in 'user_password', with: "password"
  page.fill_in 'user_password_confirmation', with: "password"
  page.click_on I18n.t('sign_up.singular')
end

step "I see I have signed up" do
  expect(page).to have_content I18n.t('misc.welcome', user: @first_name)
end
