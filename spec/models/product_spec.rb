require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    # when name is not provided
    it 'returns an error when the name field is not provided' do
      @category = Category.new(name: 'test category')      
      @product = @category.products.new(name: nill, price: 40, quantity: 3, category: @category)
      expect(@product.errors.full_messages).to include ("Name can't be blank")    
    end
    
    # when price is not provided
    it 'returns an error when the price field is not provided' do
      @category = Category.new(name: 'test category')      
      @product = @category.products.new(name: 'test product', price: nill, quantity: 3, category: @category)
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

    # when quantity is not provided
    it 'returns an error when the quantity field is not provided' do
      @category = Category.new(name: 'test category')
      @product = @category.products.new(name: 'test product', price: 40, quantity: nill, category: @category)
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    # when category is not provided
    it 'returns an error when the category field is not provided' do
      @category = Category.new(name: 'test category')      
      @product = Product.new(name: 'test product', price: 40, quantity: 3, category: nill)
      expect(@product.errors.full_messages).to include ("Category can't be blank")
    end

    # when all fields are provided
    it 'should create new product with no error' do
      @category = Category.new(name: "test category")
      @product = Product.create(name: "test product", price: 40, quantity: 3, category:@category)
      expect(@product).to be_valid
    end

  end
end