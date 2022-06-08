class ChillisController < ApplicationController
  before_action :set_chilli, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @chillis = Chilli.all
  end

  def show
    @user = @chilli.user
  end

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def set_chilli
    @chilli = Chilli.find(params[:id])
  end

  def chilli_params
    params.require(:chilli).permit(:variety, :heat, :quantity, :description, :species,
                                   :chilli_type, :date_available, :price, :shu, photos: [])
  end
end
