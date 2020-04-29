class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :cocktail_id, presence: true,  uniqueness: {scope: :ingredient_id, 
    message: "you can't have the same dose of the same ingredient on the same drink"}
  validates :ingredient_id,  presence: true,  uniqueness: {scope: :cocktail_id, 
    message: "you can't have the same dose of the same ingredient on the same drink"}
end
