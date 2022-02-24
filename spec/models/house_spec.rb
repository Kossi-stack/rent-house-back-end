require 'rails_helper'

RSpec.describe House, type: :model do
    let(:user) { User.create(name: "Test", email: "Tester@gmai.com", password: "password") }
    let(:house) { House.create(name: "Test", rooms: 1, beds: 1, baths: 1, price: 1, rating: 1, image_url: "www.google.com", description: "Test", user_id: user.id) }
    let(:reservation) { Reservation.create(user_id: user.id, house_id: house.id, start_time: "2020-02-20", end_time: "2020-02-21") }

    describe 'validations' do
      context 'when house is valid' do
        it 'is valid' do
          expect(house).to be_valid
        end
      end
      context 'when house is invalid' do
        it 'is invalid without a name' do
          expect(House.new(name: nil)).to_not be_valid
        end
      end

      context 'when room is valid' do
        it 'is valid' do
          expect(house).to be_valid
        end
      end
    end

    describe 'associations' do
      context 'when house has a user' do
        it 'has a user' do
          expect(house.user).to eq(user)
        end
      end

      context 'when house has a reservation' do
        it 'has a reservation' do
          expect(house.reservations).to eq([])
        end
      end
    end

    describe 'class methods' do
      context 'when there are no houses' do
        it 'returns an empty array' do
          expect(House.all).to eq([])
        end
      end
      context 'when there are houses' do
        it 'returns all the houses' do
          house1 = House.create(name: "Test", rooms: 1, beds: 1, baths: 1, price: 1, rating: 1, image_url: "www.google.com", description: "Test", user_id: user.id)
          house2 = House.create(name: "Test2", rooms: 1, beds: 1, baths: 1, price: 1, rating: 1, image_url: "www.google.com", description: "Test", user_id: user.id)
          expect(House.all).to eq([house1, house2])
        end
      end
    end

    describe 'instance methods' do
      context 'when there are no reservations' do
        it 'returns an empty array' do
          expect(house.reservations).to eq([])
        end
      end
      context 'when there are reservations' do
        it 'returns all the reservations' do
          reservation1 = Reservation.create(user_id: user.id, house_id: house.id, start_time: "2020-02-20", end_time: "2020-02-21")
          reservation2 = Reservation.create(user_id: user.id, house_id: house.id, start_time: "2020-02-20", end_time: "2020-02-21")
          expect(house.reservations).to eq([reservation1, reservation2])
        end
      end
    end
end
