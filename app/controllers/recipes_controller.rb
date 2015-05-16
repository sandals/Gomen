class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(new_recipe_params)
    @recipe.save

    redirect_to edit_recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.ingredients.build
    @recipe.steps.build
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.ingredients.build
    @recipe.update(update_recipe_params)

    redirect_to @recipe
  end

  private

  def new_recipe_params
    params.require(:recipe).permit(:title)
  end

  def update_recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [:ingredient, :measurement],
      steps_attributes: [:content]
    ) 
  end
end
