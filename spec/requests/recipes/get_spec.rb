require 'rails_helper'

RSpec.describe "Recipes API" do
  describe "GET /recipes?country"  do
    describe "When the record exists" do
      it 'returns a successful response', :vcr do
        get "/api/v1/recipes?country=Japan"

        expect(response).to be_successful
      end

      it 'returns http status code 200', :vcr do
        get "/api/v1/recipes?country=Japan"

        expect(response).to have_http_status(200)
      end

      it 'returns recipes for a country', :vcr do
        get "/api/v1/recipes?country=Japan"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a Hash
        expect(json).to have_key :data
        expect(json[:data]).to be_a Array

        expect(json[:data].first).to be_a Hash
        expect(json[:data].first).to have_key :id
        expect(json[:data].first).to have_key :type
        expect(json[:data].first).to have_key :attributes

        expect(json[:data].first[:id]).to be nil
        expect(json[:data].first[:type]).to be_a String
        expect(json[:data].first[:attributes]).to be_a Hash

        expect(json[:data].first[:attributes]).to have_key :title
        expect(json[:data].first[:attributes]).to have_key :url
        expect(json[:data].first[:attributes]).to have_key :country
        expect(json[:data].first[:attributes]).to have_key :image

        expect(json[:data].first[:attributes][:title]).to be_a String
        expect(json[:data].first[:attributes][:url]).to be_a String
        expect(json[:data].first[:attributes][:country]).to be_a String
        expect(json[:data].first[:attributes][:image]).to be_a String
      end
    end

    describe "When there are no recipes for a country" do
      it "returns http status code 200", :vcr do
        get "/api/v1/recipes?country=somalia"

        expect(response).to have_http_status(200)
      end

      it "returns a hash with no current recipes", :vcr do
        get "/api/v1/recipes?country=somalia"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a Hash
        expect(json).to have_key :data

        expect(json[:data]).to be_a String
        expect(json[:data]).to eq("We Are Sorry But There Are Currently No Recipes For This Country")
      end
    end

    describe "When the user does not provide a country" do
      it "returns recipes for a random country if recipes exist" do

      end
    end
  end
end
