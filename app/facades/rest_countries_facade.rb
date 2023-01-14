class RestCountriesFacade

  def self.all_countries
    RestCountriesService.all_countries.map do | country |
      RestCountry.new(country)
    end
  end
end
