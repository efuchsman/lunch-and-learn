require 'rails_helper'

RSpec.describe RecipeFacade do
  it "exists" do
    recipe_facade = RecipeFacade.new

    expect(recipe_facade).to be_an_instance_of(RecipeFacade)
  end

  describe "Class Methods" do
    describe "#recipes_by_country" do
      it "creates recipe objects from recipes based on a given country" do

        expect(RecipeFacade.recipes_by_country("japan")).to be_a Array
        expect(RecipeFacade.recipes_by_country("japan").first).to be_a Recipe
      end
    end
  end
end
