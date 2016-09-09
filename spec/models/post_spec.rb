require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "associations" do
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_length_of(:message).is_at_most(150) }
  end

end
