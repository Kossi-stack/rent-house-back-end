require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :each do
    user = User.new(id: 1, name: 'solo')
    user.email = 'foo1@foo.com'
    user.password = 'admin123'
    user.save
  end

  subject do
    Reservation.new(
      start_time: '2022-02-02',
      end_time: '2022-02-06',
      user_id: 1
    )
  end

  before { subject.save }

  it 'is not valid with invalid name' do
    subject.start_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with invalid end date' do
    subject.end_time = nil
    expect(subject).to_not be_valid
  end
end
