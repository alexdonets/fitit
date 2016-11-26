class EntriesController < ApplicationController

  before_filter :authorize, only: [:create]

  before_action :set_entry, only: [:destroy]

  def index
    @foods = Food.all
  end

  def new
  end

  def create

    @entry = current_user.entries.create(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to diary_url, notice: 'Added entry' }
        format.json { head :no_content }
      else
        format.html { redirect_to new_entry_url(entry_params[:food_id]), notice: "Can't create an entry" }
        format.json { render json:  @entry.errors, status: :unprocessable_entity }
      end

    end

  end

  def destroy

    @entry.destroy

    respond_to do |format|
      format.html { redirect_to diary_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private

    def set_entry
        @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:food_id, :amount, :day, :meal)
    end
end
