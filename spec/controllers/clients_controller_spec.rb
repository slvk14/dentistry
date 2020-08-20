# frozen_string_literal: true

require 'rails_helper'

describe ClientsController, type: :controller do
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

      it 'should return all clients' do
        do_request
        expect(response_json.count).to eq(Client.all.count)
      end
    end
  end

  describe '#GET show' do
    context 'valid request' do
      let(:do_request) { get :show, params: { id: client.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should return needed client' do
        do_request
        expect(response_json['id']).to eq(client.id)
      end
    end
  end

  describe '#POST create' do
    context 'valid request' do
      let(:do_request) { post :create, params: attributes_for(:client) }

      it 'should return response status 200' do
        Client.destroy_all

        do_request
        expect(response).to have_http_status(200)
      end

      it 'should create a new client' do
        Client.destroy_all

        do_request
        expect(Client.all.count).to eq(1)
      end
    end
  end

  describe '#PUT update' do
    context 'valid request' do
      let(:do_request) { put :update, params: { id: client.id,  first_name: 'new_name' } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should update the client' do
        do_request
        client.reload
        expect(client.first_name).to eq('new_name')
      end
    end
  end

  describe '#DELETE destroy' do
    context 'valid request' do
      let(:do_request) { delete :destroy, params: { id: client.id } }

      it 'should return response status 200' do
        do_request
        expect(response).to have_http_status(200)
      end

      it 'should delete the client' do
        expect { do_request }.to change { Client.all.count }.by(-1)
      end
    end
  end
end
