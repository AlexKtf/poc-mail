class Room < ActiveRecord::Base
  belongs_to :user

  has_many :room_users
  has_many :roomers, through: :room_users, source: :user
  has_many :messages
end
