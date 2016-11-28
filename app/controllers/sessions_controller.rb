class SessionsController < ApplicationController

  def new
    @login = true
  end

  def create

    @user = User.new
    @user = User.authenticate(params[:username], params[:password])

    respond_to do |format|

      if @user
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Logged In successfully as #{current_user.username}" }
        format.json { render :index, status: :created, location: @session }
      else
        format.html { redirect_to login_url }
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
      format.html { redirect_to login_url }
      format.json { head :no_content }
    end

  end

end
