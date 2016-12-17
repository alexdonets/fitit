class PagesController < ApplicationController

  def homepage
    if current_user
      redirect_to diary_url
    else
      redirect_to login_url
    end
  end

  def about
  end

end
