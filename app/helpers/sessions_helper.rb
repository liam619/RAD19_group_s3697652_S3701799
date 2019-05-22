module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    flash[:success] = "Log in successfully"
  end

  # Remember the user
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "You have logged out!"
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user and user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Return true if the user is admin
  def is_admin?
    if logged_in?
      current_user.admin?
    end
  end

  # Returns true if the user is current user
  def current_user?(user)
    user == current_user
  end

  # Verify the user is logged in
  def logged_in?
    !current_user.nil?
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  # For liked and disliked button
  def validateLogin
    (!current_user.nil?) ? 'btn' : 'btn disabled'
  end
end
