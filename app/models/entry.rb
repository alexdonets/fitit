class Entry < ActiveRecord::Base

  belongs_to :user
  belongs_to :food

  WEEKDAYS = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  MEALS = ["Breakfast", "Lunch", "Dinner", "Snacks"]

  validates :amount, presence: true

  validates_numericality_of :amount, greater_than_or_equal_to: 0

  validates :day, presence: true,
            :inclusion => { :in => WEEKDAYS }

  validates :meal, presence: true,
            :inclusion => { :in => MEALS }

  validates :user_id, presence: true

  validates :food_id, presence: true

  def update_amount(amount)
    self.amount = amount
  end


end
