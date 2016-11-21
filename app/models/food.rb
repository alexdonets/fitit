class Food < ActiveRecord::Base

  has_many :entries
  belongs_to :user

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
