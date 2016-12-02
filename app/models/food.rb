class Food < ActiveRecord::Base

  has_many :entries
  belongs_to :user

  CATEGORIES = { "Dairy & Eggs" => "Dairy",
                "Meat & Fish" => "Animal",
                "Fruits & Vegetables" => "Plant",
                "Nuts, beans & legumes" => "Nuts",
                "Grains" => "Grains",
                "Drinks" => "Beverages",
                "Sweets & Candy" => "Sweets",
                "Oils & Fats" => "Oils",
                "Other" => "Other" }

  validates :name, presence: true

  validates :portion, presence: true

  validates :calories, presence: true

  validates :fat, presence: true

  validates :carb, presence: true

  validates :protein, presence: true

  validates :category, presence: true

end
