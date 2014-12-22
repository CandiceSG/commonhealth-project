class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :post, :content, :user, presence: true
  validates_uniqueness_of :comment_id, scope: :user_id
end
