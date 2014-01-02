class RoomController < ApplicationController

  def index
    @users = User.all  
  end

  def create
    room = Room.create!
    room.roomers << current_user
    room.roomers << User.find(room_params['roomers'].to_i)
    room.save!
    redirect_to room_path(room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.includes(:user)
  end

  private
    def room_params
      params.require(:room).permit(:roomers)
    end
end