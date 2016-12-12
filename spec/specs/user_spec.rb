require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before :each do
      @user_base = User.create(email: 'ff@ff', password: 'gggggg', password_confirmation: 'gggggg', preferred_name: 'qqq')
      @user1 = User.new(email: 'FF@FF', password: 'gggggg', password_confirmation: 'gggggg', preferred_name: 'feqf', formatted_name:'ffff')
      @user2 = User.new(email: 'fh@fh', password: 'gg', password_confirmation: 'f', preferred_name: 'feqf', formatted_name:'ffff')

    end

    it 'should have a preferred_name' do
      expect(@user1).to be_valid
    end

    it 'should have a formatted_name' do
      expect(@user1).to be_valid
      @user1.preferred_name = nil
      expect(@user1).to_not be_valid
    end

    it 'should have a password that is nonblank and equal to the password_confirmation' do
      expect(@user1).to be_valid
      expect(@user2).to be_invalid
    end

    it 'should have an unique email' do
      expect(@user1).to be_valid
      @user1.save!
      expect(@user1.save!).to be_truthy
    end

    it 'should have an email' do
      expect(@user1).to be_valid
      @user1.email = nil
      expect(@user1).to_not be_valid
    end

    it 'should have a password of length 6 or greater' do
      expect(@user1).to be_valid
      @user1.password = 'gg'
      @user1.password_confirmation = 'gg'
      expect(@user1).to_not be_valid
    end
  end

end