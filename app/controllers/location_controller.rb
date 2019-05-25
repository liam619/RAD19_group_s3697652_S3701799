class LocationController < ApplicationController
  def new
  end

  def show
    @location = Location.find(params[:id])
    @courses = @location.courses
  end

  def index
    @locations = Location.all
  end
end