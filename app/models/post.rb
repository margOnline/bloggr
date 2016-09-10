class Post < ActiveRecord::Base
  belongs_to :user

  validates :message, presence: true, length: { maximum: 150 }
end
