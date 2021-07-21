require 'rails_helper'

RSpec.describe 'get movie show_times', type: :request do
  let!(:movie) { create(:movie_with_show_times) }

  describe 'should return movies and show times' do
    before do
      get '/api/v1/movies'
    end

    it { expect(response).to have_http_status 200 }
    it { expect(json(response)).to be_an Array }
    it { expect(json(response).length).to eq 1 }
    it { expect(json(response).first[:type]).to eq 'movie' }
    it { expect(json(response).first[:id]).to eq "#{movie.id}" }
    it { expect(json(response).first).to have_key :attributes }
    it { expect(json(response).first[:attributes][:title]).to eq movie.title }
    it { expect(json(response).first[:attributes][:imdb_id]).to eq movie.imdb_id }
    it { expect(json(response).first[:attributes]).to have_key(:show_times) }
    it { expect(json(response).first[:attributes][:show_times].length).to eq 2 }
  end
end
