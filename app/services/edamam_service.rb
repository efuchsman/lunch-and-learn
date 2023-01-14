class EdamamService

  def self.conn
    Faraday.new("https://api.edamam.com") do |f|
      f.headers['app_id'] = ENV['edamam_app_id']
      f.headers['app_key'] = ENV['edamam_api_key']
    end
  end

  def self.recipes_by_country(country)
    response = conn.get("/api/recipes/v2?type=public?q=#{country.capitalize}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
