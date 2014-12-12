class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments
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

  #validates_presence_of :first_name, :email, :password

end
