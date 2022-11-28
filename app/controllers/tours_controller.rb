class ToursController < ApplicationController
  before_action :set_tour, only: %i[show]

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @site = Site.new
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

  private

  def tour_params
    params.require(:tour).permit(:name, :description, :img_url, :privacy)
  end

  def set_tour
    @tour = Tour.find(params[:id])
  end
end
