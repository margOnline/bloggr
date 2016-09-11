RSpec.describe PostsController, type: :controller do
  describe '#index' do
    it 'gets all the posts and renders the index template' do
      get :index
      expect(response).to be_success
    end
  end

  describe '#create' do
    describe 'successfully with attributes completed' do
      it 'saves the post and redirects to homepage with a success message' do
        expect do
          post :create, post: { message: 'message' }
        end.to change(Post, :count).by(1)
        expect(Post.last.message).to eq 'message'
        expect(response).to redirect_to root_url
      end
    end

    describe 'unsuccessfully with no attributes completed' do
      it 'assigns an error message and redirects to homepage' do
        expect do
          post :create, post: { message: nil }
        end.to change(Post, :count).by(0)
        expect(response).to redirect_to root_url
      end
    end
  end

  describe '#destroy' do
    describe 'successfully' do
      it 'deletes the post and redirects to homepage with a success message' do
        post = FactoryGirl.create(:post)
        expect do
          delete :destroy, id: post.id
        end.to change(Post, :count).by(-1)
        expect(response).to redirect_to root_url
      end
    end
  end
end
