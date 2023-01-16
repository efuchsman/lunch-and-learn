require 'rails_helper'

RSpec.describe "Favorites API" do
  describe "GET /favorites" do
    describe "When the user exists" do
      it "can have favorites" do
        user = User.create!(name: "Test name", email: "testemail@test.com")

        favorite1 = {
          "api_key": user.api_key,
          "country": "Country",
          "recipe_link": "https://www.somelink.com",
          "recipe_title": "Mustard Drizzled Cheesecake"
        }

        favorite2 = {
          "api_key": user.api_key,
          "country": "Country",
          "recipe_link": "https://www.somelink.com",
          "recipe_title": "Mackerel and Onion Sandwich"
        }

        favorite3 = {
          "api_key": user.api_key,
          "country": "Country",
          "recipe_link": "https://www.somelink.com",
          "recipe_title": "Brussels Sprout Yogurt"
        }


        post api_v1_favorites_path, params: favorite1
        post api_v1_favorites_path, params: favorite2
        post api_v1_favorites_path, params: favorite3

        get "/api/v1/favorites?api_key=#{user.api_key}"
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(200)
      end
    end

    describe "When the user does not exist" do
      it 'throws an error' do

        get "/api/v1/favorites?api_key=123445jubiunuhu"
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(401)
        expect(json).to be_a Hash
        expect(json).to have_key :error
        expect(json[:error]).to be_a String
        expect(json[:error]).to eq("Invalid API Key")
      end
    end
  end
end
