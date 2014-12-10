class Supplement < ActiveRecord::Base
  has_many :user_supplements
  has_many :users, through: :user_supplements
end
