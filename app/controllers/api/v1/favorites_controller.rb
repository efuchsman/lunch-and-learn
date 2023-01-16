class Api::V1::FavoritesController < ApplicationController


  def index
    user = User.find_by(api_params)
    if user.nil?
      render json: { error: "Invalid API Key" }, status: 401
    else
      render json: FavoriteSerializer.new(user.favorites)
    end
  end

  def create
    user = User.find_by(api_params)
    if user.nil?
      render json: { error: "Invalid API Key" }, status: 401
    else
      favorite = user.favorites.new(favorite_params)
      if favorite.save
        render json: { success: "Favorite Added Successfully" }, status: 201
      else
        render json: { error: favorite.errors.messages }, status: 400
      end
    end
  end

  private

  def api_params
    params.permit(:api_key)
  end

  def favorite_params
    params.permit(:country, :recipe_title, :recipe_link)
  end
end
