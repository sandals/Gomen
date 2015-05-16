require 'rails_helper'

feature 'User creates recipe' do
  scenario 'creates a new recipe' do
    visit root_path
    create_recipe('Crazy Nachoz')

    expect(page).to have_content('Crazy Nachoz')
    expect(page).to have_content('draft')
  end

  scenario 'adding ingredients to recipe' do
    visit root_path
    create_recipe('Crazy Nachoz')
    add_ingredient('Chips', '4t')

    click_button 'Save Recipe'

    expect(page).to have_content('Chips')
    expect(page).to have_content('4t')
  end

  scenario 'adding steps to recipe' do
    visit root_path
    create_recipe('Crazy Nachoz')
    add_ingredient('Cheese', '10oz')

    fill_in '1', with: 'Grate cheese on dem chipz'
    click_button 'Save Recipe'
    
    expect(page).to have_content('Grate cheese on dem chipz')
  end

  def create_recipe(title)
    click_link 'Add Recipe'
    fill_in 'Title', with: title
    click_button 'Proceed'
  end

  def add_ingredient(ingredient, measurement)
    fill_in 'Ingredient', with: ingredient
    fill_in 'Measurement', with: measurement
  end
end
