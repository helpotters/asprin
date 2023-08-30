class Users::ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_profile_path, notice: "Profile successfully updated!"
    else
      flash.now[:alert] = "Profile update failed. Please check the errors."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image)
  end
end
