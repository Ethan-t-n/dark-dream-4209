RSpec.describe "recipes index page", type: :feature do
    it 'has a list of ingredients' do
      spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      pasta = spaghetti.ingredients.create!(name:'Pasta' , cost: 5)
      sauce = spaghetti.ingredients.create!(name:'Sauce' , cost: 6)
      cheese = spaghetti.ingredients.create!(name:'Cheese' , cost: 7)


      ramen = Recipe.create!(name: "Ramen", complexity: 3, genre: "Japanese")
      noodles = ramen.ingredients.create!(name:'Noodles' , cost: 8)
      broth = ramen.ingredients.create!(name:'Broth' , cost: 9)
      tofu = ramen.ingredients.create!(name:'Tofu' , cost: 10)

      visit '/ingredients'

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Sauce")
      expect(page).to have_content("Cheese")
      expect(page).to have_content("Noodles")
      expect(page).to have_content("Broth")
      expect(page).to have_content("Tofu")
    end

    it 'includes the number of recipes each ingredient is used in' do
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
      egg = Ingredient.create!(name:'Egg' , cost: 12)
      RecipeIngredient.create!(recipe: omelette, ingredient: egg)

    visit '/ingredients'

    within "#ingredients-#{pasta.id}" do
        expect(page).to have_content("Pasta: 1")
    end

    within "#ingredients-#{sauce.id}" do
        expect(page).to have_content("Sauce: 1")
    end

    within "#ingredients-#{cheese.id}" do
        expect(page).to have_content("Cheese: 1")
    end

    within "#ingredients-#{noodles.id}" do
        expect(page).to have_content("Noodles: 1")
    end

    within "#ingredients-#{broth.id}" do
        expect(page).to have_content("Broth: 1")
    end

    within "#ingredients-#{cheese.id}" do
        expect(page).to have_content("Cheese: 1")
    end

    within "#ingredients-#{egg.id}" do
        expect(page).to have_content("Egg: 1")
    end
  end
end


# User Story 3 of 4
# As a visitor,
# When I visit '/ingredients'
# I see a list of ingredients and the number of recipes each ingredient is used in.
# (e.g. "Ground Beef: 2"
#      "Salt: 4")
