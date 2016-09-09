class Post < ActiveRecord::Base
  belongs_to :user

  validates :message, length: { maximum: 150 }
end
