class UserWellbeing < ActiveRecord::Base
  belongs_to :user
  belongs_to :wellbeing
end
