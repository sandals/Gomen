class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(new_recipe_params)
    @recipe.save

    redirect_to edit_recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.ingredients.build if @recipe.ingredients.count < 1
    @recipe.steps.build if @recipe.steps.count < 1
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
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
      ingredients_attributes: [:id, :ingredient, :measurement],
      steps_attributes: [:id, :content]
    ) 
  end
end
