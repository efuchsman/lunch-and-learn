require 'rails_helper'

RSpec.describe "Recipes API" do
  describe "GET /recipes?country"  do
    describe "When the record exists" do
      it 'returns recipes for a country' do
        json_response = File.read('spec/fixtures/DO_NOT_DELETE/japan.json')
        stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_api_key']}&q=Japan&type=public").to_return(status: 200, body: json_response)

        get "/api/v1/recipes?country=Japan"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(200)
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
      it "returns a hash with no current recipes" do
        json_response = File.read('spec/fixtures/DO_NOT_DELETE/somalia.json')
        stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_api_key']}&q=Somalia&type=public").to_return(status: 200, body: json_response)

        get "/api/v1/recipes?country=somalia"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(200)

        expect(json).to be_a Hash
        expect(json).to have_key :data

        expect(json[:data]).to be_a String
        expect(json[:data]).to eq("We Are Sorry But There Are Currently No Recipes For This Country")
      end
    end

    describe "When the user slams too many api calls with the country provided" do
      it "returns an error telling them to wait" do
        json_response = File.read("./spec/fixtures/DO_NOT_DELETE/edamam_error.json")
        stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{ENV['edamam_app_id']}&app_key=#{ENV['edamam_api_key']}&q=Japan&type=public").to_return(status: 429, body: json_response)

        get "/api/v1/recipes?country=japan"

        json = JSON.parse(response.body, symbolize_names: true)


        expect(json).to be_a Hash
        expect(json).to have_key :error
        expect(json[:error]).to be_a String
        expect(json[:error]).to eq("Too Many API calls. Please Wait A Minute Before Trying Again")
      end
    end

    describe "When the user does not provide a country" do
      it "returns recipes for a random country if recipes exist" do
        json_response = File.read("./spec/fixtures/DO_NOT_DELETE/japan.json")
        json_parsed = JSON.parse(json_response, symbolize_names: true)
        allow(EdamamService).to receive(:recipes_by_country).and_return(json_parsed)

        get "/api/v1/recipes"
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

      describe "When the Edamam rate limit per minute gets triggered from a random search" do
        it "Provides an error and suggests the user provides their own country param" do
          allow(RecipeFacade).to receive(:recipes_by_country).and_return("Usage limits are exceeded")

          get "/api/v1/recipes"
          json = JSON.parse(response.body, symbolize_names: true)

          expect(json).to be_a Hash
          expect(json).to have_key :error
          expect(json[:error]).to be_a String
          expect(json[:error]).to eq("Too Many API calls. Please Wait A Minute Before Trying Again. It Is Strongly Suggested That A User Provides A Country Parameter For Optimal Performance.")
        end
      end

      describe "WHen the user does not provide a country and the random country does not have recipes" do
        it "returns a no recipes message" do
          allow(RecipeFacade).to receive(:recipes_by_country).and_return([])

          get "/api/v1/recipes"
          json = JSON.parse(response.body, symbolize_names: true)

          expect(json).to be_a Hash
          expect(json).to have_key :data
          expect(json[:data]).to be_a String
          expect(json[:data]).to eq("You Have Opted For A Random Country But There Are Currently No Recipes For This Country. It Is Strongly Suggested That A User Provides A Country Parameter For Optimal Performance.")
        end
      end
    end
  end
end
