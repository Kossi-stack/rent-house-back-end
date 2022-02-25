require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { User.create(name: 'Test', email: 'Tester@gmail.com', password: 'password') }
  let(:house) do
    House.create(name: 'Test', rooms: 1, beds: 1, baths: 1, price: 1, rating: 1, image_url: 'www.google.com',
                 description: 'Test', user_id: user.id)
  end
  let(:favorite) do
    Favorite.create(user_id: user.id, house_id: house.id)
  end

  describe 'validations' do
    context 'when favorite is valid' do
      it 'is valid' do
        expect(favorite).to be_valid
      end
    end
    context 'when favorite is invalid' do
      it 'is invalid without a user_id' do
        expect(Favorite.new(user_id: nil)).to_not be_valid
      end
      it 'is invalid without a house_id' do
        expect(Favorite.new(house_id: nil)).to_not be_valid
      end
    end
  end

  describe 'associations' do
    context 'when favorite has a user' do
      it 'has a user' do
        expect(favorite.user).to eq(user)
      end
    end
    context 'when favorite has a house' do
      it 'has a house' do
        expect(favorite.house).to eq(house)
      end
    end
  end

  describe 'class methods' do
    context 'when there are no favorites' do
      it 'returns an empty array' do
        expect(Favorite.all).to eq([])
      end
    end
    context 'when there are favorites' do
      it 'returns all the favorites' do
        favorite1 = Favorite.create(user_id: user.id, house_id: house.id)
        favorite2 = Favorite.create(user_id: user.id, house_id: house.id)
        expect(Favorite.all).to eq([favorite1, favorite2])
      end
    end
  end

  describe 'instance methods' do
    context 'when favorite has a user' do
      it 'has a user' do
        expect(favorite.user).to eq(user)
      end
    end
    context 'when favorite has a house' do
      it 'has a house' do
        expect(favorite.house).to eq(house)
      end
    end
  end

end