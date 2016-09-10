RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_length_of(:message).is_at_most(150) }
  end

  describe '.descending_chronologically' do
    it 'gets all posts in descending order of creation' do
      old_post = FactoryGirl.create(:post, created_at: Time.now - 1.day)
      new_post = FactoryGirl.create(:post, created_at: Time.now - 1.hour)
      expect(Post.descending_chronologically).to eq [new_post, old_post]
    end
  end
end
