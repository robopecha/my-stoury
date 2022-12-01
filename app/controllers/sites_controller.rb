class SitesController < ApplicationController

  # this route is for map testing
   # def index
     # @sites = Site.all
     # @markers = @sites.geocoded.map do |site|
       # {
         # lat: site.latitude,
         # lng: site.longitude,
         # info_window: render_to_string(partial: "info_window", locals: {site: site})
       # }
     # end
   # end

  def index
    @sites = Site.all
  end

  def show
    @site = Site.find(params[:id])
    @note = Note.new
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

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @tour = @site.tour
    @site.destroy
    redirect_to tour_path(@tour)
  end

  private

  def site_params
    params.require(:site).permit(:name, :address, :longitude, :latitude, :photo)
  end

end
