class Medication < ActiveRecord::Base
  has_many :user_medications
  has_many :users, through: :user_medications

  default_scope { order('description ASC') }
end
