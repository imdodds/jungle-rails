require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should return a valid product when all validations pass" do
      @category = Category.new
      @product = Product.new(
        name: 'New Product',
        price_cents: 1299,
        quantity: 12,
        category: @category
      )
      expect(@product).to be_valid
    end

    it "should return an invalid product when no product name is given" do
      @category = Category.new
      @product = Product.new(
        price_cents: 1299,
        quantity: 12,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it "should return an invalid product when no price is given" do
      @category = Category.new
      @product = Product.new(
        name: 'New Product',
        quantity: 12,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it "should return an invalid product when no quantity is given" do
      @category = Category.new
      @product = Product.new(
        name: 'New Product',
        price_cents: 1299,
        category: @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it "should return an invalid product when no category is given" do
      @category = Category.new
      @product = Product.new(
        name: 'New Product',
        price_cents: 1299,
        quantity: 12,
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end
  end
end
