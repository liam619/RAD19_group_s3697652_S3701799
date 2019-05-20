class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :onLoad

  # on load main page, for the header drop down box
  def onLoad
    @categories = Category.all.order(name: :asc)

    @locations = Location.all.order(name: :asc)

    @courses = Course.order(name: :asc)
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end
end
