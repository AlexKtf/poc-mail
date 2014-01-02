class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users


  def messages_with user
    Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", self.id, user, user, self.id)
  end

  def has_simple_room_with? roomer
    self.rooms.each do |r|
      return r if r.roomers.include?(roomer) and r.roomers.count == 2 
    end
    nil
  end

  def room_with roomer
    rooms = []
    self.rooms.each do |r|
      rooms << r if r.roomers.include?(roomer)
    end
  end
end
