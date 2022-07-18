require 'rails_helper'

RSpec.describe 'recipe index page' do
  it 'has the name, complexity, and genre of each recipe' do
    spaghetti = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    ramen = Recipe.create!(name: "Ramen", complexity: 3, genre: "Japanese")
    alfredo = Recipe.create!(name: "Alfredo", complexity: 4, genre: "Italian")

    visit "/recipes"

    within "#recipes-#{spaghetti.id}" do
       expect(page).to have_content("Name: Spaghetti")
       expect(page).to have_content("Complexity: 2")
       expect(page).to have_content("Genre: Italian")
     end

     within "#recipes-#{ramen.id}" do
        expect(page).to have_content("Name: Ramen")
        expect(page).to have_content("Complexity: 3")
        expect(page).to have_content("Genre: Japanese")
      end

      within "#recipes-#{alfredo.id}" do
         expect(page).to have_content("Name: Alfredo")
         expect(page).to have_content("Complexity: 4")
         expect(page).to have_content("Genre: Italian")
       end
  end
end

# User Story 1 of 4
# As a visitor,
# When I visit '/recipes',
# I see a list of recipes with the following information:
# -Name
# -Complexity
# -Genre
# (e.g. "Name: Spaghetti, Complexity: 2, Genre: Italian")
