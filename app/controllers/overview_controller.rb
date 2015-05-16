class OverviewController < ApplicationController
  def index
    @recipes = Recipe.all
  end
end
