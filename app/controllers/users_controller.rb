class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chillis = @user.chillis
    @chatrooms = Chatroom.where(seller: current_user)
                         .or(Chatroom.where(buyer: current_user))
    @markers = {
      lat: @user.latitude,
      lng: @user.longitude,
      info_window: render_to_string(partial: "info_window", locals: { user: @user }),
      image_url: helpers.asset_url("chilli-marker.png")
    }
  end
end
