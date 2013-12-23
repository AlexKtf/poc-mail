class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def messages_with user
    Message.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", self.id, user, user, self.id)
  end
end
