class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chillis = @user.chillis
    @sales = @user.sales
  end
end
