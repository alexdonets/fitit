class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_day_and_meal, :set_arrays

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_day_and_meal
    time = Time.new
    @current_weekday = set_weekday(time)
    @current_meal = set_meal(time)
  end

  def set_arrays
    @weekdays = Entry::WEEKDAYS
    @meals = Entry::MEALS
  end

  def set_weekday(time)
    if time.wday > 0
      return Entry::WEEKDAYS[time.wday-1]
    else
      return Entry::WEEKDAYS[6]
    end
  end

  def set_meal(time)
    if time.hour < 11
      return Entry::MEALS[0]
    elsif time.hour < 17
      return Entry::MEALS[1]
    else
      return Entry::MEALS[2]
    end
  end

  helper_method :current_user, :set_day_and_meal

  def authorize
    if current_user.nil?
      format.html { redirect_to(login_path, alert: 'Not authorized.')  }
      #redirect_to login_path, alert: "Not authorized" if current_user.nil?
    end
  end

end
