require 'rails_helper'

RSpec.describe "update movie details", type: :request do
  let(:movie) { create(:movie) }
  let(:url) { "/api/v1/movies/#{movie.id}" }

  context 'when user is not authenticated' do
    before do
      put url, params: { details: [] }
    end

    it { expect(response).to have_http_status(401) }
  end

  context 'when user is authenticated' do
    let(:admin_user) { create(:admin_user) }
    let(:price) { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers({}, admin_user) }

    context 'when details are valid' do
      let(:request) do
        proc {
          put(
            url,
            params: {
              details_attributes: [
                { show_time: 2.days.from_now, price: price },
                { show_time: 5.days.from_now, price: price }
              ]
            },
            headers: auth_headers
          )
        }
      end

      describe 'a successful response' do
        before { request.call }

        it { expect(response).to have_http_status(200) }
      end

      describe 'successful movie detail creation' do
        it { expect { request.call }.to change { MovieDetail.count }.by(2) }
      end
    end

    context 'when details are not valid' do
      let(:request) do
        proc {
          put(
            url,
            params: {
              details_attributes: [
                { show_time: nil, price: price },
                { show_time: 5.days.from_now, price: price }
              ]
            },
            headers: auth_headers
          )
        }
      end

      describe 'an unsuccessful response' do
        before { request.call }

        it { expect(response).to have_http_status(422) }

        describe 'an unsuccessful movie detail creation' do
          it { expect { request.call }.to change { MovieDetail.count }.by(0) }
        end
      end
    end
  end
end
