require 'rails_helper'

RSpec.describe EdamamService do
  it "exists" do
    edmam = EdamamService.new

    expect(edmam).to be_an_instance_of(EdamamService)
  end

  describe "Class Methods" do
    describe "#recipes_by_country" do
      it "displays recipes for a given country" do
        country = "japan"

        expect(EdamamService.recipes_by_country(country)).to be_a Hash
        expect(EdamamService.recipes_by_country(country)).to have_key :count
        expect(EdamamService.recipes_by_country(country)[:count]).to be_a Integer

        expect(EdamamService.recipes_by_country(country)).to have_key :hits
        expect(EdamamService.recipes_by_country(country)[:hits]).to be_a Array
        expect(EdamamService.recipes_by_country(country)[:hits].first).to have_key :recipe
      end
    end
  end
end
