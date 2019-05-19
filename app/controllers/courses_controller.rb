class CoursesController < ApplicationController

  before_action :course_owner, only: [:edit, :update]

  def show
    @course = Course.find(params[:id])
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    new_course = course_params

    # Set course created by current user
    new_course[:user_id] = current_user.id

    # Perform validation in another method
    validate_param(new_course)

    @course = Course.new(new_course)

    if !@course.errors.any? && @course.validate
      @course.save
      flash[:success] = "#{@course.name} created."
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    update_course = course_params

    validate_param(update_course)

    if @course.update_attributes(update_course)
      flash[:success] = "#{@course.name} successful updated."
      redirect_to course_path(@course.id)
    else
      render 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :image, :prerequisites => [], :categories => [], :locations => [])
  end

  # Replace the params (ids) with hash value
  def validate_param(params)
    # Convert ids to Hash
    if params[:locations].present?
      params[:locations].collect! {|l| Location.find(l)}
    end

    if params[:categories].present?
      params[:categories].collect! {|c| Category.find(c)}
    end

    if params[:prerequisites].present?
      params[:prerequisites].collect! {|p| Prerequisite.where(id: p).first_or_initialize} # New prerequisite if not found
    end
  end

  # Ensure non course owner unable to edit the course that not belong to them
  def course_owner
    @course = Course.find(params[:id])
    user = User.find(@course.user_id)
    if !current_user?(user)
      flash[:danger] = "You are not authorized to edit this course."
      redirect_back(fallback_location: root_path)
    end
  end
end
