require 'rails_helper'

RSpec.describe Dish, type: :model do

  describe "validations" do
      it {should validate_presence_of :name}
      it {should validate_presence_of :description}
  end

  describe "relationships" do
      it {should belong_to :chef}
      it {should have_many :dish_ingredients}
      it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before(:each) do
    @chef1 = Chef.create!(name: "Boyardi")
    @chef2 = Chef.create!(name: "Soup King")

    @dish1 = @chef1.dishes.create!(name: "Hamburger", description: "Burger on a bun with toppings")
    @dish2 = @chef1.dishes.create!(name: "Pasta", description: "Noodles in a sauce")

    @dish3 = @chef2.dishes.create!(name: "Soup", description: "Buncha vegetables in a pot blended")
    
    @ingredient1 = Ingredient.create!(name: "Ground Beef", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Slice O Cheese", calories: 50)
    @ingredient3 = Ingredient.create!(name: "Lettuce", calories: 5)
    @ingredient4 = Ingredient.create!(name: "Tomato", calories: 5)

    @ingredient5 = Ingredient.create!(name: "Noodles", calories: 100)
    @ingredient6 = Ingredient.create!(name: "Red Sauce", calories: 50)
    @ingredient7 = Ingredient.create!(name: "Parmesan Cheese", calories: 10)
    @ingredient8 = Ingredient.create!(name: "Oregano", calories: 5)

    @ingredient9 = Ingredient.create!(name: "Potato", calories: 20)
    @ingredient10 = Ingredient.create!(name: "Carrot", calories: 20)
    @ingredient11 = Ingredient.create!(name: "Cabbage", calories: 10)
    @ingredient12 = Ingredient.create!(name: "Onion", calories: 20)
    

    @dish_ingredient1 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient1)
    @dish_ingredient2 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient2)
    @dish_ingredient3 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient3)
    @dish_ingredient3 = DishIngredient.create!(dish: @dish1, ingredient: @ingredient4)

    @dish_ingredient4 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient4)
    @dish_ingredient5 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient5)
    @dish_ingredient6 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient6)
    @dish_ingredient7 = DishIngredient.create!(dish: @dish2, ingredient: @ingredient7)    

    @dish_ingredient9 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient9)
    @dish_ingredient10 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient10)
    @dish_ingredient11 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient11)
    @dish_ingredient12 = DishIngredient.create!(dish: @dish3, ingredient: @ingredient12)
  end
  describe "#instance_methods" do
    describe "calorie_count" do
      it "totals the calories of a specific dish's ingredients" do
        expect(@dish1.calorie_count).to eq(160)
      end
    end
    
  end
end