require 'rails_helper'

RSpec.describe "Learning Resources API" do
  describe "GET /learning_resources?country" do
    describe "When the record exists" do
      it "returns learning resources", :vcr do
        get "/api/v1/learning_resources?country=Belgium"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(200)

        expect(json).to be_a Hash
        expect(json).to have_key :data
        expect(json[:data]).to be_a Hash

        expect(json[:data]).to have_key :id
        expect(json[:data]).to have_key :type
        expect(json[:data]).to have_key :attributes

        expect(json[:data][:id]).to be nil
        expect(json[:data][:type]).to be_a String
        expect(json[:data][:attributes]).to be_a Hash

        expect(json[:data][:attributes]).to have_key :country
        expect(json[:data][:attributes]).to have_key :video
        expect(json[:data][:attributes]).to have_key :images

        expect(json[:data][:attributes][:country]).to be_a String
        expect(json[:data][:attributes][:video]).to be_a Hash
        expect(json[:data][:attributes][:images]).to be_a Array

        expect(json[:data][:attributes][:video]).to have_key :title
        expect(json[:data][:attributes][:video]).to have_key :youtube_video_id

        expect(json[:data][:attributes][:video][:title]).to be_a String
        expect(json[:data][:attributes][:video][:youtube_video_id]).to be_a String

        expect(json[:data][:attributes][:images].first).to have_key :alt_tag
        expect(json[:data][:attributes][:images].first).to have_key :url

        expect(json[:data][:attributes][:images].first[:alt_tag]).to be_a String
        expect(json[:data][:attributes][:images].first[:url]).to be_a String
      end
    end

    describe "When a non-existent country in provided" do
      it "returns an error message", :vcr do
        get "/api/v1/learning_resources?country=B3lgium"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(404)

        expect(json).to be_a Hash
        expect(json).to have_key :error

        expect(json[:error]).to be_a String
        expect(json[:error]).to eq("Please Check That The Country Provided Is A Real Country")
      end
    end

    describe "When the user does not provide a country" do
      it "returns an error", :vcr do
        get "/api/v1/learning_resources?country"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)

        expect(json).to be_a Hash
        expect(json).to have_key :error

        expect(json[:error]).to be_a String
        expect(json[:error]).to eq("Please Provide A Country Parameter")
      end
    end
  end
end
