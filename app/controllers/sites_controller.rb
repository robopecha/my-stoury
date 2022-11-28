class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.tour = Tour.find(params[:tour_id])
    if @site.save
      redirect_to tour_path(@site.tour)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def site_params
    params.require(:site).permit(:name, :longitude, :latitude, :img_url)
  end
end
