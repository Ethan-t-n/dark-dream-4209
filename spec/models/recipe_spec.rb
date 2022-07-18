require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end
  describe 'class methods' do
   describe '#total_cost' do
     it 'returns the total cost of all the ingredients in the recipe' do
       spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
       pasta = Ingredient.create!(name: "Pasta", cost: 5)
       sauce = Ingredient.create!(name: "Sauce", cost: 6)
       cheese = Ingredient.create!(name: "Cheese", cost: 7)
       RecipeIngredient.create!(recipe: spaghetti, ingredient: pasta)
       RecipeIngredient.create!(recipe: spaghetti, ingredient: sauce)
       RecipeIngredient.create!(recipe: spaghetti, ingredient: cheese)


       ramen = Recipe.create!(name: "Ramen", complexity: 3, genre: "Japanese")
       noodles = Ingredient.create!(name:'Noodles' , cost: 8)
       broth = Ingredient.create!(name:'Broth' , cost: 9)
       tofu = Ingredient.create!(name:'Tofu' , cost: 10)
       egg = Ingredient.create!(name:'Egg' , cost: 10)
       RecipeIngredient.create!(recipe: ramen, ingredient: noodles)
       RecipeIngredient.create!(recipe: ramen, ingredient: broth)
       RecipeIngredient.create!(recipe: ramen, ingredient: tofu)
       RecipeIngredient.create!(recipe: ramen, ingredient: egg)

       omelette = Recipe.create!(name: "Omelette", complexity: 5, genre: "French")
       omelette_ingredients = Ingredient.create!(name:'egg' , cost: 12)
       egg = Ingredient.create!(name:'Egg' , cost: 12)
       RecipeIngredient.create!(recipe: omelette, ingredient: egg)

       expect(spaghetti.total_cost).to eq(18)
       expect(ramen.total_cost).to eq(37)
       expect(omelette.total_cost).to eq(12)
     end
   end
 end
end
