class User < ActiveRecord::Base

  has_many :entries
  has_many :foods

  after_initialize :init

  attr_accessor :password_confirmation

  validates_uniqueness_of :username, :case_sensitive => false

  validates :username, presence: true,
            length: { minimum: 4 }

  validates :password, presence: true,
            length: { minimum: 6 },
            :confirmation => true,
            :on => :create

  validates :email, presence: true

  validates_uniqueness_of :email, :case_sensitive => false

  validates_format_of :email,
      :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :password_confirmation, presence: true,
            :on => :create

  def init
    self.calorie_goal ||= 0
    self.fat_goal ||= 0
    self.carb_goal ||= 0
    self.protein_goal ||= 0
    self.fiber_goal ||= 0
    self.sugar_goal ||= 0
  end
=begin
  def authenticate(user, password)
    user = find_by_username(username)
    if user && user.password == password
  end
=end


end
