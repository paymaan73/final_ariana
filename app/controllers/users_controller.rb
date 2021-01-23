class UsersController < ApplicationController

  def index
    root?
    @users = User.all
  end

  def destroy
    root?
    user  = User.find(params[:id])
    if user.destroy
      redirect_to users_path, notice: "Deleting user"
    end
  end

end
