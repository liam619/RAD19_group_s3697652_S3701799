class CoursesController < ApplicationController
  include CoursesHelper

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
    new_course = params.require(:course).permit(:name, :description, :image, :prerequisites => [], :categories => [], :locations => [])

    # Set course created by current user
    new_course[:user_id] = current_user.id

    # Convert ids to Hash
    if new_course[:locations].present?
      new_course[:locations].collect! {|l| Location.find(l)}
    end

    if new_course[:categories].present?
      new_course[:categories].collect! {|c| Category.find(c)}
    end

    if new_course[:prerequisites].present?
      new_course[:prerequisites].collect! {|p| Prerequisite.where(id: p).first_or_initialize} # New prerequisite if not found
    end

    @course = Course.new(new_course)

    if !@course.errors.any? && @course.validate
      @course.save
      flash[:success] = "#{@course.name} created."
      redirect_to courses_path
    else
      render 'new'
    end
  end
end
