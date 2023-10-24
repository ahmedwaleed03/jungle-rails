require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.create(name: "Test Category")
    @product = Product.new(
      name: 'Name',
      price_cents: 100,
      quantity: 5,
      category: @category
    )
  end

  describe 'Validations' do
    it "validates with all fields" do
      expect(@product).to be_valid
    end

    it "name cannot be nil" do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "price cannot be nil" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "quantity cannot be nil" do
      @product.quantity = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "category cannot be nil" do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
