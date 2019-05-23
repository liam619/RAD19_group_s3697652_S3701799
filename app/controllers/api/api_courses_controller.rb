class Api::ApiCoursesController < ApiController

  def show
    render json: @course = Course.where(["name like ?", "%#{params[:name]}%"])
  end


  def index
    render json: @courses = Course.all
  end
end