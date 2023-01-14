class Recipe
  attr_reader :title,
              :url,
              :image

  def initialize(data)
    @title = data[:recipe][:label]
    @url = data[:url]
    @image = data[:recipe][:image]
  end
end
