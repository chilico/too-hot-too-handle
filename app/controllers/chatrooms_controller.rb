class ChatroomsController < ApplicationController
  def index
    @chatroom = Chatroom.where(seller: current_user)
                        .or(Chatroom.where(buyer: current_user))
                        .order(updated_at: :desc).first
    redirect_to chatroom_path(@chatroom)
  end

  def show
    @chatrooms = Chatroom.where(seller: current_user)
                         .or(Chatroom.where(buyer: current_user))
                         .order(updated_at: :desc)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new(set_params)
    @chatroom.buyer = current_user
    if @chatroom.save
      redirect_to chatroom_path(@chatroom), status: :see_other
    else
      redirect_to :back
    end
  end

  private

  def set_params
    params.require(:chatroom).permit(:name, :seller_id)
  end
end
