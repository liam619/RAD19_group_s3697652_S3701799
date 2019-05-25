class LikecoursesController < ApplicationController

  # Make sure the user is logged in before can place like
  before_action :logged_in_user

  def new
    course = Course.find(params[:id])
    meta = {user_id: current_user.id, course_id: params[:id]}

    # Verify is the user already like/dislike the course
    if (LikeCourse.exists?(meta) || DislikeCourse.exists?(meta))
      flash[:danger] = "You have already liked/disliked for #{course.name}."
    else
      # Add a new like to the course from current user
      LikeCourse.create(user_id: current_user.id, course_id: course.id)
      flash[:success] = "Thank you for liking #{course.name}."
    end

    # keep the user in the same page after place like
    redirect_back(fallback_location: root_path)
  end
end
