class Api::ApiCoursesController < ApiController

  def show
    render json: @course = Course.find(params[:id])
  end

  def index
    render json: @courses = Course.all
  end
end