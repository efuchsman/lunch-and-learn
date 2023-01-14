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
      until !recipes.blank?
        next_country = RestCountriesFacade.random_country.name
        recipes = RecipeFacade.recipes_by_country(next_country)
        if recipes == "Usage limits are exceeded"
          break
        end
      end
      if recipes == "Usage limits are exceeded"
        render json: { error: "Too Many API calls. Please Wait A Minute Before Trying Again" }, status: 404
      else
        render json:RecipeSerializer.new(recipes)
      end
    end
  end
end
