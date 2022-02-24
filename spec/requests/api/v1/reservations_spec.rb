require 'rails_helper'

RSpec.describe 'Api::V1::Reservations', type: :request do
  background do
    visit user_session
    fill_in 'Name', with: 'Test'
    fill_in 'Email', with: 'donard@gmail.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign up'
  end

  describe 'GET /api/v1/reservations' do
    it 'works! (now write some real specs)' do
      get '/api/v1/reservations'
      expect(response).to have_http_status(200)
    end
  end
  describe 'POST /create' do
    it 'create a new reservations' do
      post '/api/v1/reservations?user_id=1&house_id=1'
      expect(response.body).to include('user_id')
    end
  end
end
