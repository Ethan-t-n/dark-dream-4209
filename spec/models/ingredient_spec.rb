require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'model methods' do
    it "#total_recipes" do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      pasta = spaghetti.ingredients.create!(name:'Pasta' , cost: 5)
      sauce = spaghetti.ingredients.create!(name:'Sauce' , cost: 6)
      cheese = spaghetti.ingredients.create!(name:'Cheese' , cost: 7)
      ingredient = Ingredient.create!(name: "Pasta", cost: 5)
      spaghetti_pasta = RecipeIngredient.create!(recipe_id: spaghetti.id, ingredient_id: ingredient.id)


      ramen = Recipe.create!(name: "Ramen", complexity: 3, genre: "Japanese")
      noodles = ramen.ingredients.create!(name:'Noodles' , cost: 8)
      broth = ramen.ingredients.create!(name:'Broth' , cost: 9)
      tofu = ramen.ingredients.create!(name:'Tofu' , cost: 10)


      expect(ingredient.total_recipes).to eq(1)
    end
  end
end
