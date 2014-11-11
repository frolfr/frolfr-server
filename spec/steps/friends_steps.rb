step "I navigate to friends" do
  visit '/friends'
end

step "I add the other user as a friend" do
  @full_name = @other_user.decorate.full_name
  js = %Q{
    $('#autocomplete-friends').typeahead('val', '#{@full_name}');
    var event = $.Event('keydown');
    event.which = 40;
    $('#autocomplete-friends').trigger(event);
    $('.tt-suggestion:contains("#{@full_name}")').click();
  }
  page.execute_script(js)
  find("[rel~=submit-friend]").click
end

step "I should see that user is now a friend" do
  within "#friends" do
    expect(page).to have_content(@full_name)
  end
end
