class User < ActiveRecord::Base

  has_many :entries

  after_initialize :init

  has_many :foods

  validates :username, presence: true,
            length: { minimum: 4 }

  validates :password, presence: true,
            length: { minimum: 6 }

  def init
    self.calorie_goal ||= 0
    self.fat_goal ||= 0
    self.carb_goal ||= 0
    self.protein_goal ||= 0
    self.fiber_goal ||= 0
    self.sugar_goal ||= 0
  end


end
