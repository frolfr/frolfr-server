require 'spec_helper'

describe 'Accessing Protected Resources' do
  ProtectedResourcesController = Class.new(ApplicationController)

  controller ProtectedResourcesController do
    def index
      render text: 'MUCH SUCCESS!'
    end
  end

  let(:user) { FactoryGirl.create(:user) }

  specify 'with a valid token and email' do
    auth_via_token(token: user.auth_token, email: user.email)
    get :index
    expect(response.status).to eq(200)
  end

  specify 'with a valid token and incorrectly-cased email' do
    auth_via_token(token: user.auth_token, email: user.email.upcase)
    get :index
    expect(response.status).to eq(200)
  end

  specify 'with an invalid email' do
    bad_email = "bad-#{user.email}"
    auth_via_token(token: user.auth_token, email: bad_email)
    get :index
    expect(response.status).to eq(401)
  end

  specify 'without an email' do
    auth_via_token(token: user.auth_token, email: '')
    get :index
    expect(response.status).to eq(401)
  end

  specify 'with an invalid token' do
    bad_token = user.auth_token.reverse
    auth_via_token(token: bad_token, email: user.email)
    get :index
    expect(response.status).to eq(401)
  end

  def auth_via_token(token:, email:)
    token_header = %[Token token="#{token}", email="#{email}"]
    request.headers['Authorization'] = token_header
  end
end
