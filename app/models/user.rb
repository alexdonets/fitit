require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :entries
  has_many :foods

  before_save :encrypt_password
  after_save :clear_password

  after_initialize :init

  attr_accessor :password

  validates_uniqueness_of :username, :case_sensitive => false

  validates :username, presence: true,
            :length => { :in => 3..20 }

  validates :password, presence: true,
            length: { minimum: 6 },
            :confirmation => true
            #:on => :create

  validates :email, presence: true

  validates_uniqueness_of :email, :case_sensitive => false

  validates_format_of :email,
      :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i


  def init
    self.calorie_goal ||= 0
    self.fat_goal ||= 0
    self.carb_goal ||= 0
    self.protein_goal ||= 0
    self.fiber_goal ||= 0
    self.sugar_goal ||= 0
  end

  def encrypt_password
    if self.password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)

    if user && user.match_password(password)
      return user
    else
      return false
    end
  end



  def match_password(password)
    password_hash == BCrypt::Engine.hash_secret(password, salt)
  end

end
