class Food < ActiveRecord::Base

  validates :name, presence: true

  validates :portion, presence: true

  validates :calories, presence: true

  validates :fat, presence: true

  validates :carb, presence: true

  validates :protein, presence: true

  validates :fiber, presence: true

  validates :sugar, presence: true

  validates :category, presence: true

end
