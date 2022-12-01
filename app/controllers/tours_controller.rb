class ToursController < ApplicationController
  before_action :set_tour, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @tours = Tour.where(name: params[:query])
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @note = Note.new
    @site = Site.new
    @sites = Site.where("tour_id = ?", @tour.id)
    @chatroom = @tour.chatroom
    @message = Message.new
    if @sites.size > 0
      @markers = @sites.geocoded.map do |site|
        {
          lat: site.latitude,
          lng: site.longitude,
          info_window: render_to_string(partial: "sites/info_window", locals: {site: site})
        }
      end
    end
  end

  def new
    @tour = Tour.new
    @chatroom = Chatroom.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    @chatroom = Chatroom.new(name: @tour.name)
    if @tour.save
      @chatroom.tour_id = @tour.id
      @chatroom.save
      # @tour_user = TourUser.new
      # @tour_user.tour = @tour
      # @tour_user.user = current_user
      # @tour_user.save
      redirect_to tour_path(@tour)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour.destroy
    redirect_to tours_path, status: :see_other
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :photo, :privacy)
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
