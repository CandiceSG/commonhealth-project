class UserSupplement < ActiveRecord::Base
  belongs_to :user
  belongs_to :supplement
end
