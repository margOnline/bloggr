RSpec.describe 'posts/index.html.haml', type: :view do
  it 'displays the posting form' do
    assign :posts, []
    render
    expect(rendered).to have_css('form')
    expect(rendered).to have_css('button')
    expect(rendered).to have_content('No messages have been posted')
  end

  it 'displays the post title, the date created and a delete button' do
    assign :posts, [FactoryGirl.create(:post, created_at: (Time.now - 1.day))]
    render
    expect(rendered).to have_css('div', text: 'message')
    expect(rendered).to have_css('.time', text: '1 day ago')
    expect(rendered).to have_css('a', text: 'delete')
  end
end
