module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    flash[:success] = "Log in successfully"
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "You have logged out!"
  end

  # For liked and unliked button
  def validateLogin
    (!current_user.nil?)? 'btn' : 'btn disabled'
  end
end
