require 'rails_helper'

RSpec.describe 'rate movies spec' do
  let(:movie) { create(:movie) }
  let(:end_point) { "/api/v1/movies/#{movie.id}/rating" }

  context 'when rating is valid' do
    let(:request) do
      proc { post end_point, params: { rating: Faker::Number.within(range: 1..5) } }
    end

    describe 'create rating response' do
      before do
        request.call
      end

      it { expect(response).to have_http_status 201 }
      it { expect(response.body).to be_empty }
      it { expect(1..5).to cover movie.reload.rating }
    end

    it { expect { request.call }.to change(MovieRating, :count).by 1 }
  end

  context 'when rating is not valid' do
    let(:request) do
      proc { post end_point, params: { rating: 6 } }
    end

    describe 'an unsuccessful response' do
      before do
        request.call
      end

      def json(response)
        JSON.parse(response.body, symbolize_names: true)
      end

      it { expect(response).to have_http_status 422 }

      it { expect(json(response)).to have_key(:rating) }

      it 'should show the expected error message' do
        expect(json(response)[:rating]).to eq ["can only be between numbers 1 - 5"]
      end
    end

    it { expect { request.call }.to change(MovieRating, :count).by 0 }
  end
end
