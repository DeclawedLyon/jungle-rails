require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'saves successfully when user provides all required fields' do
      @category = Category.new(name: 'test category')      
      @product = @category.products.new(name: 'test product', price: 40, quantity: 3)
      @product.save!
    end
    # when name is not provided
    it 'returns an error when the name field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new( price: 40, quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # when price is not provided
    it 'returns an error when the price field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new(name: 'test product', quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    # when quantity is not provided
    it 'returns an error when the quantity field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new(name: 'test product', price: 40)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    # when category is not provided
    it 'returns an error when the category field is not provided' do
      @product = Product.new(name: 'test product', price: 40, quantity: 3)
      @product.save
      puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end