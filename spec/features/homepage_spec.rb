feature 'Viewing the timeline' do
  scenario 'User visits homepage' do
    when_the_user_visits_the_homepage
    then_they_should_see_the_timeline
    and_they_should_see_a_form_for_posting
  end

  def when_the_user_visits_the_homepage
    visit '/'
  end

  def then_they_should_see_the_timeline
    expect(page).to have_css('.timeline')
  end

  def and_they_should_see_a_form_for_posting
    expect(page).to have_css('form')
    expect(page).to have_css('button')
  end
end
