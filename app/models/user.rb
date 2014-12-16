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

  validates :first_name, :email, :password, presence: true


def friends(only_pending = false)
    user_friends = []
    my_friends = Friendship.includes([:sender, :receiver]).where("sender_id = ? or receiver_id = ?",  self.id, self.id)
    my_friends.each do |friend|
      if (only_pending && !friend.status) || (!only_pending && friend.status)
        if friendship.receiver_id == self.id
          user_friends << friendship.sender
        else
          user_friends << friendship.receiver
        end
      end
    end
    user_friends
  end

end
