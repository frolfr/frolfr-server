require 'spec_helper'

describe 'Requesting an authorization token' do
  let!(:user) { FactoryGirl.create(:user, password: 'sneaky', password_confirmation: 'sneaky', email: 'coolguy@example.com') }
  let(:parsed_response) { JSON.parse(response.body) }

  specify 'with valid credentials' do
    post '/api/authorizations', email: user.email, password: user.password, format: :json
    expect(response.status).to eq(201)
    expect(parsed_response["token"]).to eq(user.auth_token)
  end

  specify 'with invalid credentials' do
    post '/api/authorizations', email: user.email, password: 'passwerd', format: :json
    expect(response.status).to eq(422)
  end
end
