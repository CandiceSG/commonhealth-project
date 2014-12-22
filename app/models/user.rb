class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, :dependent => :destroy
  accepts_nested_attributes_for :posts,:reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  has_many :comments, through: :posts

  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :events
  has_many :experiences
  has_many :user_symptoms
  has_many :symptoms, through: :user_symptoms
  has_many :user_medications
  has_many :medications, through: :user_medications
  has_many :user_supplements
  has_many :supplements, through: :user_supplements
  has_many :user_wellbeings
  has_many :wellbeings, through: :user_wellbeings

  #validates :first_name, :email, :password, presence: true

end
