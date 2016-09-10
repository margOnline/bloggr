class Post < ActiveRecord::Base
  validates :message, presence: true, length: { maximum: 150 }

  def self.descending_chronologically
    order(created_at: :desc)
  end
end
