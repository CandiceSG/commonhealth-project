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

  #validates :first_name, :email, :password, presence: true


  def friends(only_pending = false)
    user_friends = []
    my_friends = Friendship.includes([:sender, :receiver]).where("sender_id = ? or receiver_id = ?",  self.id, self.id)
    my_friends.each do |friendship|
      if (only_pending && !friendship.status == accepted ) || (!only_pending && friendship.status == accepted)
        if friendship.receiver_id == self.id
          user_friends << friendship.sender
        else
          user_friends << friendship.receiver
        end
      end
    end
    user_friends
  end

  def friends_by_status()
  user_friends = []
  user_requests = []
  user_propositions = []
  my_friends = Friendship.includes([:sender, :receiver]).where("sender_id = ? or receiver_id = ?",  self.id, self.id)
  my_friends.each do |friendship|
    if friendship.status == accepted
      if friendship.receiver_id == self.id
        user_friends << {friendship_user: friendship.sender, friendship_relation:friendship}
      else
        user_friends << {friendship_user: friendship.receiver, friendship_relation:friendship}
      end
    else
      if friendship.receiver_id == self.id
        user_propositions << {friendship_user: friendship.sender, friendship_relation:friendship}
      else
        user_requests << {friendship_user: friendship.receiver, friendship_relation:friendship}
      end
    end
  end
  {user_friend: user_friends, user_propositions: user_propositions, user_requests: user_requests}
end
end
