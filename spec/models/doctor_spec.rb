require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let!(:doctor) { create(:doctor) }

  context 'validation tests' do
    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe '#name' do
      it { is_expected.to validate_presence_of(:email) }
    end
  end

  context 'association tests' do
    describe '#appointments' do
      it { should have_many :appointments }
      it { should have_many :clients }
    end
  end
end
