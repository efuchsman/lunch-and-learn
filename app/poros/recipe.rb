class Recipe
  attr_reader :title,
              :url,
              :image,
              :country

  def initialize(data, country)
    @title = data[:recipe][:label]
    @url = data[:recipe][:url]
    @image = data[:recipe][:image]
    @country = country.capitalize
  end
end
