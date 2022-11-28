class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @site = site.new
  end
  
end
