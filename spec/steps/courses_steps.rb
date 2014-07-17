step "there is a course" do
  @course = FactoryGirl.create(:course)
end

step "I've played the course" do
  round = FactoryGirl.create(:round, course: @course)
  FactoryGirl.create(:scorecard, round: round, user: @user)
end

step "I navigate to courses" do
  page.find("a.left-off-canvas-toggle").click
  page.click_on(I18n.t('course.plural'))
end

step "I should see the course" do
  within("#courses") do
    expect(page).to have_content @course.name
  end
end

step "I navigate to suggest a new course" do
  page.find("a.left-off-canvas-toggle").click
  page.click_on(I18n.t('course.new'))
end

step "I fill out the new course form" do
  page.fill_in 'course_name', with: @course_name = "Mars"
  page.fill_in 'course_city', with: "The Crater"
  select 'Alabama', from: 'course_state'
  page.click_on I18n.t('course.suggest')
end

step "I see I have suggested a course" do
  expect(page).to have_content I18n.t('course.success', course: @course_name)
end
