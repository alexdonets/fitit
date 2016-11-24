class SessionsController < ApplicationController

  def new
    flash[:notice] = ""
  end

  def create
    user = User.new
    user = User.find_by_username(params[:username])
    respond_to do |format|
      if user && user.password == params[:password]
        session[:user_id] = user.id
        format.html { redirect_to diary_url, notice: 'Logged In successfully' }
        format.json { render :index, status: :created, location: @session }
      else

        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
        #flash.now.alert = "Email or password is invalid"
        flash[:notice] = "Email or password is invalid"
        #render "new"
      end
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Logged Out successfully' }
      format.json { head :no_content }
    end

  end

end
