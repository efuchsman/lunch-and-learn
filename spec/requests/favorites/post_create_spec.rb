require 'rails_helper'

RSpec.describe "Favorites API" do
  describe "POST /favorites" do
    describe "When the user exists" do
      it "creates a favorite" do
        user = User.create!(name: "Test name", email: "testemail@test.com")

        favorite = {
          "api_key": user.api_key,
          "country": "Country",
          "recipe_link": "https://www.somelink.com",
          "recipe_title": "Mayonnaise Covered Poptarts"
        }

        post api_v1_favorites_path, params: favorite
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(201)
        expect(json).to be_a Hash
        expect(json).to have_key :success
        expect(json[:success]).to be_a String
        expect(json[:success]).to eq("Favorite Added Successfully")
      end
    end

    describe "When user does not exist" do
      it 'returns an error' do
        favorite = {
          "api_key": "1a2s3d4f5g6h7j8k9l0fihjeoifhoa4f",
          "country": "Country",
          "recipe_link": "https://www.somelink.com",
          "recipe_title": "Chocolate Dipped Gefilte Fish"
        }
        post api_v1_favorites_path, params: favorite
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(401)
        expect(json).to be_a Hash
        expect(json).to have_key :error
        expect(json[:error]).to be_a String
        expect(json[:error]).to eq("Invalid API Key")
      end
    end

    describe "When the users but favorite params are not complete" do
      it "renders an error" do
        user = User.create!(name: "Test name", email: "testemail@test.com")

        favorite = {
          "api_key": user.api_key,
          "country": "Country",
          "recipe_title": "Deep-Fried Pinecone"
        }

        post api_v1_favorites_path, params: favorite
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(json).to be_a Hash
        expect(json).to have_key :error
        expect(json[:error]).to be_a Hash
        expect(json[:error]).to have_key :recipe_link
      end
    end
  end
end
