class ChillisController < ApplicationController
  before_action :set_chilli, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @starting_chilli_type = ''
    if params[:query].present? && params[:query] == "fresh"
      @starting_chilli_type = "fresh"
      @chillis = Chilli.all
    elsif params[:query].present? && params[:query] == "dried"
      @starting_chilli_type = "dried"
      @chillis = Chilli.all
    elsif params[:query].present? && params[:query] == "seeds"
      @starting_chilli_type = "seeds"
      @chillis = Chilli.all
    elsif params[:query].present?
      @chillis = Chilli.search(params[:query])
    else
      @chillis = Chilli.all
    end

    @markers = @chillis.map do |chilli|
      {
        lat: chilli.user.latitude,
        lng: chilli.user.longitude,
        info_window: render_to_string(partial: "info_window", locals: {chilli: chilli}),
        image_url: helpers.asset_url("chilli-marker.png")
      }
    end
  end

  def show
    @user = @chilli.user
    @markers = {
      lat: @user.latitude,
      lng: @user.longitude,
      info_window: render_to_string(partial: "info_window", locals: { user: @user }),
      image_url: helpers.asset_url("chilli-marker.png")
    }
  end

  def new
    @user = current_user
    @chilli = Chilli.new
  end

  def create
    @chilli = Chilli.new(chilli_params)
    @chilli.user = current_user
    if @chilli.save
      redirect_to chilli_path(@chilli)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @chilli.update(chilli_params)
    redirect_to chilli_path(@chilli), status: :see_other
  end

  def destroy
    @chilli.destroy
    redirect_to user_path(current_user), status: :see_other
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
