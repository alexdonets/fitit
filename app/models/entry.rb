class Entry < ActiveRecord::Base

  belongs_to :user
  belongs_to :food

  DAY_OPTIONS = %w{MON TUE WED THU FRI SAT SUN}
  MEAL_OPTIONS = %w{BREAKFAST LUNCH DINNER SNACKS}

  validates :amount, presence: true

  validates :day, presence: true,
            :inclusion => { :in => DAY_OPTIONS }

  validates :meal, presence: true,
            :inclusion => { :in => MEAL_OPTIONS }

  validates :user, presence: true

  validates :food, presence: true

end
