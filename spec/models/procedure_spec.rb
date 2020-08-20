require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let!(:procedure) { create(:procedure) }

  context 'validation tests' do
    describe 'factory' do
      it { is_expected.to be_truthy }
    end
  end

  context 'association tests' do
    describe '#appointments' do
      it { should have_many :appointments }
    end
  end
end
