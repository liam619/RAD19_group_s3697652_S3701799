class DislikecoursesController < ApplicationController

  # Make sure the user is logged in before can place dislike
  before_action :logged_in_user

  def new
    course = Course.find(params[:id])
    meta = {user_id: current_user.id, course_id: params[:id]}

    # Verify is the user already like/dislike the course
    if (LikeCourse.exist?(meta) || DislikeCourse.exists?(meta))
      flash[:danger] = "You have already liked/disliked for #{course.name}."
    else
      # Add a new dislike to the course from current user
      DislikeCourse.create(user_id: current_user.id, course_id: course.id)
      flash[:success] = "Apologies for the dissatisfied of #{course.name}, we will find way to improve the course in the near future."
    end

    # keep the user in the same page after place dislike
    redirect_back(fallback_location: root_path)
  end
end
