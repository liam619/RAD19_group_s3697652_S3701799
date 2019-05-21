class LocationsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def show
    @location = Location.find(params[:id])
    @courses = @location.courses
  end

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(new_location)
    if @location.save
      flash[:success] = "New location #{@location.name} created."
      redirect_to courses_path
    else
      render 'new'
    end
  end

  private

  def new_location
    params.require(:location).permit(:name)
  end
end
