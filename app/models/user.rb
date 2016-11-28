require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :entries
  has_many :foods

  ACTIVITY = {"Sedentary" => 1.2,
              "Lightly Active" => 1.375,
              "Moderately Active" => 1.55,
              "Very Active" => 1.725,
              "Extremely Active" => 1.9}


  SEX = { "Male" => 'M',
          "Female" => 'F'}


  GOAL = {"Lose 1 kg/week" => -1,
          "Lose 0.5 kg/week" => -0.5,
          "Lose 0.25 kg/week" => -0.25,
          "Maintain weight" => 0,
          "Gain 0.25 kg/week" => 0.25,
          "Gain 0.5 kg/week" => 0.5}

  before_save :encrypt_password
  after_save :clear_password

  after_initialize :init

  attr_accessor :password, :password_confirmation

  validates_uniqueness_of :username, :case_sensitive => false

  validates :username, presence: true,
            :length => { :in => 3..20 }

  validates :password, presence: true,
            length: { minimum: 6 },
            :confirmation => true,
            :on => :create

  validates :password_confirmation, presence: true,
            :on => :create

  validates :email, presence: true

  validates_uniqueness_of :email, :case_sensitive => false

  validates_format_of :email,
      :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :height, :inclusion => { :in => 100..250 },
                      :on => :update

  validates :weight, :inclusion => { :in => 20..400 },
                      :on => :update

  validates :age, :inclusion => { :in => 10..100 },
                  :on => :update

  validates :bodyfat, presence: false,
                      :inclusion => { :in => 1..100 },
                      :on => :update

  validates :carb_goal, presence: true
  validates :carb_goal, presence: true
  validates :protein_goal, presence: true
  validates :fat_goal, presence: true
  validates_numericality_of :calorie_goal, greater_than_or_equal_to: 0
  validates_numericality_of :carb_goal, greater_than_or_equal_to: 0
  validates_numericality_of :protein_goal, greater_than_or_equal_to: 0
  validates_numericality_of :fat_goal, greater_than_or_equal_to: 0


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


  def set_macros
    self.set_bmr
    #flash[:notice] = "#{self.username}"

    self.set_tdee(self.bmr)

    self.set_calorie_goal(self.tdee)

    self.set_macronutrients(self.calorie_goal)

  end

  def set_bmr

    if bodyfat

      self.bmr = 370 + ( 21.6 * weight * ( 100 - self.bodyfat ) / 100 )

    else

      if self.sex == 'M'

        self.bmr = 66 + ( 13.7 * self.weight ) +
                    ( 5 * self.height ) - ( 6.8 * self.age)
      else

        self.bmr = 655 + ( 9.6 * self.weight ) +
                    ( 1.8 * self.height ) - ( 4.7 * self.age )
      end

    end

  end

  def set_tdee(bmr)
    self.tdee = bmr.to_f * self.activity_level.to_f
  end

  def set_calorie_goal(tdee)
    self.calorie_goal = tdee + ( self.goal.to_f * 1000 * 9 * 0.87 / 7)
  end

  def set_macronutrients(calorie_goal)
    if self.goal.to_f < 0
      self.protein_goal = to_lbs(self.weight)
      self.fat_goal = to_lbs(self.weight) * 0.5

    elsif self.goal.to_f > 0
      self.protein_goal = to_lbs(self.weight) * 0.82
      self.fat_goal = calorie_goal * 0.3 / 9

    else
      self.protein_goal = to_lbs(self.weight) * 0.82
      self.fat_goal = calorie_goal * 0.3 / 9

    end

    self.carb_goal = ( calorie_goal - ( self.protein_goal * 4 ) -
                    ( self.fat_goal * 9 ) ) / 4

    self.fiber_goal = calorie_goal / 100

    self.sugar_goal = calorie_goal / 30

  end

  def to_lbs(kg)
    return kg * 2.20462
  end

  def get_sex
    return SEX.get_index(self.sex)
    # if self.sex == 'M'
    #   return SEX.get_index
    # else
    #   return "Female"
    # end
  end

  def manual_macros(params)

    # if validate_macros(params)
    #   self.calorie_goal = params[:calorie_goal]
    #   self.carb_goal = params[:carb_goal]
    #   self.protein_goal = params[:protein_goal]
    #   self.fat_goal = params[:fat_goal]
    #   self.fiber_goal = current_user.calorie_goal / 100
    #   self.sugar_goal = current_user.calorie_goal / 30
    # else
    #   return false
    #
    # end

    self.calorie_goal = params[:calorie_goal]
    self.carb_goal = params[:carb_goal]
    self.protein_goal = params[:protein_goal]
    self.fat_goal = params[:fat_goal]
    self.fiber_goal = self.calorie_goal / 100
    self.sugar_goal = self.calorie_goal / 30

    # self.calorie_goal = params[:calorie_goal]
    # self.carb_goal = params[:carb_goal]
    # self.protein_goal = params[:protein_goal]
    # self.fat_goal = params[:fat_goal]

    # self.fiber_goal = self.calorie_goal / 100
    # self.sugar_goal = self.calorie_goal / 30

  end

  # def validate_macros(params)
  #
  #   validates :carb_goal, presence: true
  #   validates :protein_goal, presence: true
  #   validates :fat_goal, presence: true
  #
  #   validates_numericality_of :carb_goal, greater_than_or_equal_to: 0
  #   validates_numericality_of :protein_goal, greater_than_or_equal_to: 0
  #   validates_numericality_of :fat_goal, greater_than_or_equal_to: 0
  #
  # end

  def get_activity_level

  end

  def get_goal

  end

end
