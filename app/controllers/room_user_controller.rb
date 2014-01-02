class RoomUserController < ApplicationController
 
  def create
    room = Room.find(params[:room_id])
    room.roomers << User.find(user_room_params[:user_id])
    room.save!
    redirect_to room_path(room)
  end

  private

    def user_room_params
      params.require(:room_user).permit(:user_id)
    end
end
