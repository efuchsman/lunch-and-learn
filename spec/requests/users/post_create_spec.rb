require 'rails_helper'

RSpec.describe "User API" do
  describe "POST /users" do
    describe "When the parameters are met and the email is unique" do
      it "creates a new user" do
        user = ({
          "name": "Athena Dao",
          "email": "athenadao@bestgirlever.com"
        })

        post api_v1_users_path, params: user

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response).to have_http_status(201)
        expect(json).to be_a Hash

        expect(json).to have_key(:data)
        expect(json[:data]).to be_a Hash

        expect(json[:data]).to have_key :id
        expect(json[:data]).to have_key :type
        expect(json[:data]).to have_key :attributes

        expect(json[:data][:id]).to be_a String
        expect(json[:data][:type]).to be_a String
        expect(json[:data][:attributes]).to be_a Hash

        expect(json[:data][:attributes]).to have_key :name
        expect(json[:data][:attributes]).to have_key :email
        expect(json[:data][:attributes]).to have_key :api_key

        expect(json[:data][:attributes][:name]).to be_a String
        expect(json[:data][:attributes][:email]).to be_a String
        expect(json[:data][:attributes][:api_key]).to be_a String
      end
    end

    describe "when the user email is not unique" do
      it "throws an error" do
        user = {
          "name": "Athena Dao",
          "email": "athenadao@bestgirlever.com"
        }

        post api_v1_users_path, params: user
        post api_v1_users_path, params: user

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to_not be_successful
        expect(response).to have_http_status(400)
        expect(json).to be_a Hash

        expect(json).to have_key :email
        expect(json[:email].first).to eq("has already been taken")
      end
    end
  end
end
