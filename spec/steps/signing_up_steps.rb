step 'I visit the sign up page' do
  visit '/users/new'
end

step 'I fill out the sign up form' do
  page.fill_in 'email', with: 'david@frolfr.com'
  page.fill_in 'firstName', with: @first_name = 'David'
  page.fill_in 'lastName', with: @last_name = 'Bowie'
  page.fill_in 'password', with: 'password'
  page.fill_in 'passwordConfirmation', with: 'password'
  page.click_on 'Sign Up'
end

step 'I see I have signed up' do
  expect(page).to have_content 'Welcome to Frolfr!'
  expect(page).to have_content "#{@first_name} #{@last_name}"
end
