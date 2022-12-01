class TourUsersController < ApplicationController

  def new
    @tour_user = TourUser.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    @tour_user = TourUser.new(tour_user_params)
    @tour = Tour.find(params[:tour_id])
    @tour_user.tour = @tour
    @users = User.all.map { |user| user.username }
    if @tour_user.save
      redirect_to tour_path(@tour)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tour_user = TourUser.find(params[:id])
    @tour_user.destroy
    redirect_to tour_path(@tour_user.tour), status: :see_other
  end


  private

  def tour_user_params
    params.require(:tour_user).permit(:user_id)
  end
end
