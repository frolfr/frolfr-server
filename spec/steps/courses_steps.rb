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
