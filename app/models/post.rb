class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy

  accepts_nested_attributes_for :comments

  validates_presence_of :user, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  validates :content, presence: true
  validates_associated :comments

  PRIVACY = [["Public", "La communauté" ], ["Mes amis", "Amis"]]
end
