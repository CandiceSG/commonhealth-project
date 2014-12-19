class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  accepts_nested_attributes_for :comments

  validates_presence_of :user
  validates_uniqueness_of :post_id, scope: :user_id


  PRIVACY = [["Everyone","public" ], ["My friends", "friends"]]
end
