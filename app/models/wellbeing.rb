class Wellbeing < ActiveRecord::Base
  has_many :user_wellbeings
  has_many :users, through: :user_wellbeings
end
