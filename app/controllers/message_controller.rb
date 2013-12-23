class MessageController < ApplicationController

  def create
    if current_user.id == message_params[:sender_id].to_i and User.exists?(message_params[:receiver_id])
      message = Message.create!(message_params)
      MessageMailer.has_new_message(message).deliver
      redirect_to message_path(message.receiver_id)
    end
  end

  def show
    @receiver = User.find(params[:id])
    @messages = current_user.messages_with(@receiver)
  end

  private
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :content)
    end
end
