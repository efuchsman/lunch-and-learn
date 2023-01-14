class Api::V1::RecipesController < ApplicationController

  def index
    country = params[:country]
    if !country.blank?
      recipes = RecipeFacade.recipes_by_country(country)
    else
      recipes = RecipeFacade.recipes_by_country(RestCountriesFacade.random_country.name)
    end
    if recipes.blank?
      render json: { data: "We Are Sorry But There Are Currently No Recipes For This Country" }
    elsif recipes == "Usage limits are exceeded"
      render json: { error: "Too Many API calls. Please Wait A Minute Before Trying Again" }
    else
    render json:RecipeSerializer.new(recipes)
    end
  end
end
