class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
    @courses = @location.courses
  end

  def index
    @locations = Location.all
  end
end
