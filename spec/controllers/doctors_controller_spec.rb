# frozen_string_literal: true

require 'rails_helper'

describe DoctorsController, type: :controller do
  let!(:appointment) { create(:appointment) }
  let!(:client) { create(:client) }
  let!(:doctor) { create(:doctor) }
  let!(:procedure) { create(:procedure) }
  let!(:doctor2) { create(:doctor) }

  describe 'GET #index' do
    context 'valid request' do
      let(:do_request) { get :index }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should return all doctors' do
        do_request
        expect(response_json.count).to eq(Doctor.all.count)
      end
    end
  end

  describe '#GET show' do
    context 'valid request' do
      let(:do_request) { get :show, params: { id: doctor.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should return needed doctor' do
        do_request
        expect(response_json['id']).to eq(doctor.id)
      end
    end
  end

  describe '#POST create' do
    context 'valid request' do
      let(:do_request) { post :create, params: attributes_for(:doctor) }

      it 'should return response status 200' do
        Doctor.destroy_all

        do_request
        expect(response).to have_http_status(200)
      end

      it 'should create a new doctor' do
        Doctor.destroy_all

        do_request
        expect(Doctor.all.count).to eq(1)
      end
    end
  end

  describe '#PUT update' do
    context 'valid request' do
      let(:do_request) { put :update, params: { id: doctor.id,  first_name: 'new_name' } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should update the doctor' do
        do_request
        doctor.reload
        expect(doctor.first_name).to eq('new_name')
      end
    end
  end

  describe '#DELETE destroy' do
    context 'valid request' do
      let(:do_request) { delete :destroy, params: { id: doctor.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should delete the doctor' do
        expect { do_request }.to change { Doctor.all.count }.by(-1)
      end
    end
  end
end
