class CategoriesController < ApplicationController

  before_action :logged_in_user, only: [:new, :create]

  def show
    @category = Category.find(params[:id])
    @courses = @category.courses
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(new_category)
    if @category.save
      flash[:success] = "New category #{@category.name} created."
      redirect_to courses_path
    else
      render 'new'
    end
  end

  private

  def new_category
    params.require(:category).permit(:name)
  end

end
