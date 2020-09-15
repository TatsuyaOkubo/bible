class UsersController < ApplicationController

def show
  redirect_to edit_user_path
end

  def edit
    redirect_to new_user_session_path unless user_signed_in?
  end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end