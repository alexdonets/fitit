class EntriesController < ApplicationController

  before_filter :authorize, only: [:create]
  
  def create
    @user = User.find(params[:user_id])

    @entry = @user.entries.create(entry_params)

    redirect_to user_path(@user)
  end

  private
    def entry_params
      params.require(:entry).permit(:food_id, :amount, :day, :meal)
    end
end
