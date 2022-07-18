class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :cost

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def total_recipes
    toal_recipes_with_ingredient = []
       RecipeIngredient.all.each do |recipe_ingredient|
           if recipe_ingredient.ingredient_id == id
               toal_recipes_with_ingredient << recipe_ingredient
           end
       end
       toal_recipes_with_ingredient.count
  end
end
