require 'rails_helper'

RSpec.describe Client, type: :model do
  let!(:client) { create(:client) }

  context 'validation tests' do
    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:email) }
    end
  end
end
