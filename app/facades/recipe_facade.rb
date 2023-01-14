class RecipeFacade

  def self.recipes_by_country(country)
    EdamamService.recipes_by_country(country)[:hits].map do | recipe |
      Recipe.new(recipe, country)
    end
  end
end
