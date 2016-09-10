require 'rails_helper'

RSpec.describe "posts/index.html.haml", type: :view do
  let(:user) { User.create(username: "margo") }
  it "displays the post title, date created and name of poster" do
    assign :posts, [Post.new(message: "message", user_id: user.id)]

    render

    expect(rendered).to have_css("div", text: "message")
  end
end