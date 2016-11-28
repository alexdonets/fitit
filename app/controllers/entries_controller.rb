class EntriesController < ApplicationController

  before_filter :authorize, only: [:create]

  before_action :set_entry, only: [:destroy]

  def index
    @foods = Food.all

    @day_total = 0
    @meal_total = 0
  end

  def new
  end

  def edit

  
  end

  def create

    @entry = current_user.entries.create(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to diary_url(:curr_day => entry_params[:day]), notice: 'Added entry' }
        format.json { head :no_content }
      else
        format.html { head :no_content}
        format.json { render json:  @entry.errors, status: :unprocessable_entity }
      end

    end

  end

  def clear_day
    current_user.entries.where(day: params[:day]).delete_all

    respond_to do |format|
      # format.html { redirect_to diary_url, notice: 'Entry was successfully destroyed.' }
      format.html { redirect_to diary_path(:curr_day => params[:day]), :remote => false }
      format.json { head :no_content }
    end
  end

  def clear_week
    current_user.entries.delete_all

    respond_to do |format|

      format.html { redirect_to diary_path, :remote => :false }
      format.json { head :no_content }
    end
  end

  def destroy
    return_day = @entry.day
    @entry.destroy

    respond_to do |format|
      # format.html { redirect_to diary_url, notice: 'Entry was successfully destroyed.' }
      format.html { redirect_to diary_url(:curr_day => return_day) }
      format.json { head :no_content }
    end

  end

  def update

    @entry = Entry.find(entry_params[:id])
    respond_to do |format|

      if @entry.update_amount(entry_params[:amount])

        @entry.save

        format.html { redirect_to diary_url(:curr_day => entry_params[:day])}#, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_entry
        @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:id, :food_id, :amount, :day, :meal)
    end
end
