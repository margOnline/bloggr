require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    it 'gets all the posts and renders the index template' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:user) { User.create(username: 'margo') }
    describe 'successfully with attributes completed' do
      it 'saves the post and responds with json' do
        expect do
          post :create, post: { user_id: user.id, message: 'message' }
        end.to change(Post, :count).by(1)
        expect(Post.last.message).to eq 'message'
        expect(response).to redirect_to root_url
      end
    end

    describe 'unsuccessfully with no attributes completed' do
      it 'does not save the post and responds with an error message' do
        expect do
          post :create, post: { user_id: user.id, message: nil }
        end.to change(Post, :count).by(0)
        expect(response).to render :edit
      end
    end
  end
end
