class Friendship < ApplicationRecord
  validates_uniqueness_of :inviter_id, :scope => :accepter_id

  belongs_to :inviter, :class_name => "User"
  belongs_to :accepter, :class_name => "User"


end
