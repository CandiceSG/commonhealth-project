class UserMedication < ActiveRecord::Base
  belongs_to :user
  belongs_to :medication

  validates_presence_of :medication, :user
  validates_uniqueness_of :medication_id, scope: :user_id
end
