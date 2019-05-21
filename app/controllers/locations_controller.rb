class LocationsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]
  before_action :logged_in_admin, only: [:index, :edit, :update, :destroy]

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
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = "New location #{@location.name} created."
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Location successful updated."
      redirect_to locations_path
    else
      render 'edit'
    end
  end

  def destroy
    location = Location.find(params[:id]).destroy
    flash[:success] = "#{location.name} removed."
    redirect_to locations_path
  end

  private

  def location_params
    params.require(:location).permit(:name)
  end
end
