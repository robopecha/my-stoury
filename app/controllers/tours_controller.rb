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
    if @sites.size > 0
      @markers = @sites.geocoded.map do |site|
        {
          lat: site.latitude,
          lng: site.longitude,
          info_window: render_to_string(partial: "sites/info_window", locals: {site: site}),
          id: site.id
        }
      end
    end
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    @tour.user = current_user
    if @tour.save
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
