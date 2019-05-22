class UsersController < ApplicationController

  before_action :non_user, only: [:new, :create]
  before_action :correct_user, only: [:edit, :update]
  before_action :logged_in_admin, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    # Hide certain details from User view profile page
    @hide_for_view = true
  end

  # Index will not display admin user
  def index
    @users = User.all.where(admin: false)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successful register as coordinator."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "#{user.name} removed."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Confirm current user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
