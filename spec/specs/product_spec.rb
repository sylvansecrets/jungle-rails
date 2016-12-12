require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before :each do
      @category = Category.create(name: 'Cat')
      @product = Product.new(name: "ff", price: 1, quantity: 2, category: @category)

    end

    it 'should have a valid name' do
      expect(@product).to be_valid
    end

    it 'should have a valid category' do
      expect(@product).to be_valid
    end

    it 'should have a valid price' do
      expect(@product).to be_valid
    end

    it 'should have a valid quantity' do
      expect(@product).to be_valid
    end

    it 'should be invalid if there is no name' do
      @product.name = ''
      expect(@product).to_not be_valid
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it 'should be invalid if there is no category' do
      @product.category = nil
      expect(@product).to_not be_valid
    end

    it 'should be invalid if there is no price' do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it 'should be invalid if there is no quantity' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

  end

end