feature 'Deleting a post' do
  scenario 'Succesfully' do
    given_a_user_is_on_the_homepage
    when_they_delete_a_message
    then_they_should_not_see_the_message_on_the_timeline
    and_they_should_see_successful_delete_message
  end

  def given_a_user_is_on_the_homepage
    visit '/'
  end

  def when_they_delete_a_message
    post_message
    first('.post > a.delete').click
  end

  def then_they_should_not_see_the_message_on_the_timeline
    expect(page).not_to have_content('message to be deleted')
  end

  def and_they_should_see_successful_delete_message
    expect(page).to have_content('Message deleted')
  end

  private

  def post_message
    fill_in('post_message', with: 'message to be deleted')
    click_button('Post')
  end
end
