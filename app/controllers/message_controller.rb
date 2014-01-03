class MessageController < ApplicationController


  def create
    if current_user.id == message_params[:user_id].to_i and Room.exists?(message_params[:room_id])
      message = Message.create!(message_params)
      MessageMailer.has_new_message(message).deliver
      redirect_to room_path(message.room.id)
    end
  end

  private
    def message_params
      params.require(:message).permit(:user_id, :room_id, :content)
    end
end
