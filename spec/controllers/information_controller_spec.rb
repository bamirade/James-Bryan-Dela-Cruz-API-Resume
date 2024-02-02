require 'simplecov'
SimpleCov.start 'rails'

require 'rails_helper'

RSpec.describe InformationsController, type: :controller do
  before do
    create(:endpoint)
    create(:project)
    create(:experience)
    create(:contact)
    create(:feedback)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #routes' do
    it 'returns a success response with JSON containing endpoints' do
      get :routes
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      json_response = JSON.parse(response.body)
      expect(json_response['endpoints']).to be_present
    end
  end

  describe 'GET #resume' do
    it 'returns a success response with JSON containing resume information' do
      get :resume
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to be_present
      expect(json_response['aboutMe']).to be_present
      expect(json_response['contacts']).to be_present
      expect(json_response['projects']).to be_present
      expect(json_response['experience']).to be_present
    end
  end

  describe 'GET #project' do
    it 'returns a success response with JSON containing projects' do
      get :project
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      json_response = JSON.parse(response.body)
      expect(json_response['projects']).to be_present
    end
  end

  describe 'GET #experience' do
    it 'returns a success response with JSON containing experiences' do
      get :experience
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      json_response = JSON.parse(response.body)
      expect(json_response['experiences']).to be_present
    end
  end

  describe 'GET #contact_info' do
    it 'returns a success response with JSON containing contact information' do
      get :contact_info
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      json_response = JSON.parse(response.body)
      expect(json_response['contact_info']).to be_present
    end
  end

  describe 'POST #feedbacks' do
    let(:valid_params) { { email: 'test@example.com', message: 'This is a valid message' } }

    context 'with valid params' do
      it 'creates a new feedback and sends a success response' do
        expect {
          post :feedbacks, params: valid_params
        }.to change(Feedback, :count).by(1)

        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Feedback sent successfully')
      end
    end

    context 'with invalid params' do
      it 'does not create a new feedback and sends an error response' do
        post :feedbacks, params: { email: 'invalid_email', message: 'Short' }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to be_present
      end
    end

    context 'with empty params' do
      it 'does not create a new feedback and sends an error response' do
        post :feedbacks, params: { email: '', message: '' }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('Empty email or message')
      end
    end
  end
end
