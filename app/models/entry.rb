class Entry < ActiveRecord::Base

  belongs_to :user

  validates :owner_id, presence: true

  validates :food_id, presence: true

  validates :amount, presence: true

  validates :day, presence: true

  validates :meal, presence: true
end
