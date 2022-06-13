class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chillis = @user.chillis
  end
end
