class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_except, ->(user) { where.not(id: user) }

  has_many :friendships, ->{ where(:status => "accepted") }, :class_name => "Friendship", :foreign_key => "inviter_id"

  has_many :added_friendships, ->{ where(:status => "added") }, :class_name => "Friendship", :foreign_key => "inviter_id"

  has_many :pending_friendships, ->{ where(:status => "pending") }, :class_name => "Friendship", :foreign_key => "inviter_id"

end
