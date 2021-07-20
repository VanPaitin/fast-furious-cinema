require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to validate_uniqueness_of(:imdb_id) }

  it { is_expected.to validate_presence_of(:title) }

  it { is_expected.to have_many(:movie_details).dependent(:destroy) }

  it { is_expected.to accept_nested_attributes_for(:movie_details).allow_destroy(true) }
end
