class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @tour = Tour.new
  end

  def dashboard
    @tours = current_user.all_tours
    @tour = Tour.new
  end

end
