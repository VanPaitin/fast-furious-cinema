require 'rails_helper'

RSpec.describe 'admin_user sign in', type: :request do
  let(:admin_user) { create(:admin_user) }
  let(:url) { '/api/admin_users/sign_in' }
  let(:params) do
    {
      admin_user: {
        email: admin_user.email,
        password: admin_user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns valid JWT token' do
      token_from_request = response.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token_from_request, ENV['DEVISE_JWT_SECRET_KEY'], false)
      expect(decoded_token.first['sub']).to be_present
    end
  end

  context 'when login params are incorrect' do
    before { post url }

    it 'returns unauthorized status' do
      expect(response.status).to eq 401
    end
  end
end

RSpec.describe 'admin user sign out', type: :request do
  let(:admin_user) { create(:admin_user) }
  let(:headers) do
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
  end
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, admin_user) }
  let(:url) { '/api/admin_users/sign_out' }

  it 'returns 204, no content' do
    delete url, headers: auth_headers

    expect(response).to have_http_status(204)
  end
end
