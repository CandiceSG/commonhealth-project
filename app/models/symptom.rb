class Symptom < ActiveRecord::Base
  has_many :user_symptoms
  has_many :user, through: :user_symptoms
end
