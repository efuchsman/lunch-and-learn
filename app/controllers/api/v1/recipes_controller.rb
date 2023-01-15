class Api::V1::RecipesController < ApplicationController

  def index
    country = params[:country]
    if !country.blank?
      recipes = RecipeFacade.recipes_by_country(country)
      if recipes.blank?
        render json: { data: "We Are Sorry But There Are Currently No Recipes For This Country" }
      elsif recipes == "Usage limits are exceeded"
        render json: { error: "Too Many API calls. Please Wait A Minute Before Trying Again" }, status: 404
      else
        render json:RecipeSerializer.new(recipes)
      end
    end

    if country.blank? || country.nil?
      recipes = RecipeFacade.recipes_by_country(RestCountriesFacade.random_country.name)
      if recipes.blank?
        render json: { data: "You Have Opted For A Random Country But There Are Currently No Recipes For This Country. It Is Strongly Suggested That A User Provides A Country Parameter For Optimal Performance." }
      elsif recipes == "Usage limits are exceeded"
        render json: { error: "Too Many API calls. Please Wait A Minute Before Trying Again. It Is Strongly Suggested That A User Provides A Country Parameter For Optimal Performance." }, status: 404
      else
        render json:RecipeSerializer.new(recipes)
      end
    end
  end
end
