class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
    current_user.update_attributes!(user_params)
    redirect_to action: :show
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end
end
