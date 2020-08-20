# frozen_string_literal: true

require 'rails_helper'

describe ProceduresController, type: :controller do
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

      it 'should return all procedures' do
        do_request
        expect(response_json.count).to eq(Procedure.all.count)
      end
    end
  end

  describe '#GET show' do
    context 'valid request' do
      let(:do_request) { get :show, params: { id: procedure.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should return needed procedure' do
        do_request
        expect(response_json['id']).to eq(procedure.id)
      end
    end
  end

  describe '#POST create' do
    context 'valid request' do
      let(:do_request) { post :create, params: attributes_for(:procedure) }

      it 'should return response status 200' do
        Procedure.destroy_all

        do_request
        expect(response).to have_http_status(200)
      end

      it 'should create a new procedure' do
        Procedure.destroy_all

        do_request
        expect(Procedure.all.count).to eq(1)
      end
    end
  end

  describe '#PUT update' do
    context 'valid request' do
      let(:do_request) { put :update, params: { id: procedure.id,  name: 'new_name' } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should update the procedure' do
        do_request
        procedure.reload
        expect(procedure.name).to eq('new_name')
      end
    end
  end

  describe '#DELETE destroy' do
    context 'valid request' do
      let(:do_request) { delete :destroy, params: { id: procedure.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should delete the procedure' do
        expect { do_request }.to change { Procedure.all.count }.by(-1)
      end
    end
  end
end
