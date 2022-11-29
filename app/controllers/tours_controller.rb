class ToursController < ApplicationController
  before_action :set_tour, only: %i[show edit update destroy]

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @note = Note.new
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
