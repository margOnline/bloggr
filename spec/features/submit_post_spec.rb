feature 'Posting a message' do
  scenario 'Succesfully' do
    given_a_user_is_on_the_homepage
    when_they_post_a_message
    then_they_should_see_the_message_on_the_timeline
    and_they_should_see_successful_post_message
  end

  scenario 'Unsuccessfully: message is more than 150 characters' do
    given_a_user_is_on_the_homepage
    when_they_post_an_invalid_message(too_long_post)
    then_they_should_not_see_the_message_on_the_timeline(too_long_post)
    and_they_should_see_an_error_message(too_long_error_message)
  end

  scenario 'Unsuccessfully: message is empty' do
    given_a_user_is_on_the_homepage
    when_they_post_an_invalid_message
    then_they_should_not_see_the_message_on_the_timeline
    and_they_should_see_an_error_message(blank_error_message)
  end

  def given_a_user_is_on_the_homepage
    visit '/'
  end

  def when_they_post_a_message
    fill_in('post_message', with: 'message')
    click_button('Post')
  end

  def then_they_should_see_the_message_on_the_timeline
    expect(page).to have_content('message')
  end

  def and_they_should_see_successful_post_message
    expect(page).to have_content('Message posted')
  end

  def when_they_post_an_invalid_message(message = nil)
    fill_in('post_message', with: message)
    click_button('Post')
  end

  def then_they_should_not_see_the_message_on_the_timeline(message = nil)
    expect(page).not_to have_css('.post p', text: message)
  end

  def and_they_should_see_an_error_message(error_message)
    expect(page).to have_content(error_message)
  end

  private

  def too_long_post
    'this string is 33 characters long ' * 5
  end

  def too_long_error_message
    'Message is too long (maximum is 150 characters)'
  end

  def blank_error_message
    'Message can\'t be blank'
  end
end
