require 'rails_helper'

RSpec.describe 'recipe show page' do
  it 'shows list of the ingredients the recipe has' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    pasta = Ingredient.create!(name:'Pasta' , cost: 5)
    sauce = Ingredient.create!(name:'Sauce' , cost: 6)
    cheese = Ingredient.create!(name:'Cheese' , cost: 7)
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
    egg = Ingredient.create!(name:'Egg' , cost: 10)
    RecipeIngredient.create!(recipe: omelette, ingredient: egg)


    visit "/recipes/#{spaghetti.id}"

    expect(page).to have_content('Pasta')
    expect(page).to have_content('Sauce')
    expect(page).to have_content("Cheese")


    expect(page).to_not have_content('Noodles')
    expect(page).to_not have_content('Broth')
    expect(page).to_not have_content('Tofu')
    expect(page).to_not have_content('Egg')
  end
  it 'has a total cost of all the ingredients listed in the spaghetti recipe' do
   spaghetti = Recipe.create!(name: "spaghetti", complexity: 2, genre: "italian")
   pasta = Ingredient.create!(name: "Pasta", cost: 5)
   sauce = Ingredient.create!(name: "Sauce", cost: 6)
   cheese = Ingredient.create!(name: "Cheese", cost: 7)
   RecipeIngredient.create!(recipe: spaghetti, ingredient: pasta)
   RecipeIngredient.create!(recipe: spaghetti, ingredient: sauce)
   RecipeIngredient.create!(recipe: spaghetti, ingredient: cheese)

   visit "/recipes/#{spaghetti.id}"

   within "#total_cost" do
       expect(page).to have_content("Total cost is:")
       expect(page).to have_content(18)
   end
 end

  it 'has a total cost of all the ingredients listed in the ramen recipe' do
    ramen = Recipe.create!(name: "Ramen", complexity: 3, genre: "Japanese")
    noodles = Ingredient.create!(name:'Noodles' , cost: 8)
    broth = Ingredient.create!(name:'Broth' , cost: 9)
    tofu = Ingredient.create!(name:'Tofu' , cost: 10)
    egg = Ingredient.create!(name:'Egg' , cost: 10)
    RecipeIngredient.create!(recipe: ramen, ingredient: noodles)
    RecipeIngredient.create!(recipe: ramen, ingredient: broth)
    RecipeIngredient.create!(recipe: ramen, ingredient: tofu)
    RecipeIngredient.create!(recipe: ramen, ingredient: egg)

     visit "/recipes/#{ramen.id}"

     within "#total_cost" do
          expect(page).to have_content("Total cost is:")
          expect(page).to have_content(37)


   end
 end

   it 'has a total cost of all the ingredients listed in the egg recipe' do
     omelette = Recipe.create!(name: "Omelette", complexity: 5, genre: "French")
     omelette_ingredients = Ingredient.create!(name:'egg' , cost: 12)
     egg = Ingredient.create!(name:'Egg' , cost: 12)
     RecipeIngredient.create!(recipe: omelette, ingredient: egg)

     visit "/recipes/#{omelette.id}"

     within "#total_cost" do
        expect(page).to have_content("Total cost is:")
        expect(page).to have_content(12)


    end
  end
end





# User Story 2 of 4
# As a visitor,
# When I visit '/recipes/:id'
# I see a list of the names of the ingredients the recipe has.
# (e.g. "Pasta, Meat, Cheese")
