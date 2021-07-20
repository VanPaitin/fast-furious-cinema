require 'rails_helper'

RSpec.describe MovieDetail, type: :model do
  it { is_expected.to belong_to(:movie) }

  it { is_expected.to validate_numericality_of(:price) }

  context 'when show time is in the future' do
    subject { build(:movie_detail) }

    it { is_expected.to be_valid }
  end

  context 'when show time is not in the future' do
    subject { build(:movie_detail, show_time: 1.day.ago) }

    it { is_expected.to be_invalid }
  end
end
