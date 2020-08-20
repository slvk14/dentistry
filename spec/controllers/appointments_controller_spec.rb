# frozen_string_literal: true

require 'rails_helper'

describe AppointmentsController, type: :controller do
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

      it 'should return all appointments' do
        do_request
        expect(response_json.count).to eq(Appointment.all.count)
      end
    end
  end

  describe '#GET show' do
    context 'valid request' do
      let(:do_request) { get :show, params: { id: appointment.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should return needed appointment' do
        do_request
        expect(response_json['id']).to eq(appointment.id)
      end
    end
  end

  describe '#POST create' do
    context 'valid request' do
      let(:do_request) { post :create, params: { client_id: client.id, doctor_id: doctor.id, procedure_id: procedure.id, appointment_date: DateTime.now} }

      it 'should return response status 200' do
        Appointment.destroy_all

        do_request
        expect(response).to have_http_status(200)
      end

      it 'should create a new appointment' do
        Appointment.destroy_all

        do_request
        expect(Appointment.all.count).to eq(1)
      end
    end
  end

  describe '#PUT update' do
    context 'valid request' do
      let(:do_request) { put :update, params: { id: appointment.id,  doctor_id: doctor2.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should update the appointment' do
        do_request
        appointment.reload
        expect(appointment.doctor_id).to eq(doctor2.id)
      end
    end
  end

  describe '#DELETE destroy' do
    context 'valid request' do
      let(:do_request) { delete :destroy, params: { id: appointment.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should delete the appointment' do
        expect { do_request }.to change { Appointment.all.count }.by(-1)
      end
    end
  end
end
