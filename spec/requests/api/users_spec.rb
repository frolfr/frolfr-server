require 'spec_helper'

describe Api::UsersController do
  describe 'POST /users' do
    let(:valid_params) do
      {
        email:    'doug@dougfunnie.com',
        password: 'iheartpatti',
        password_confirmation: 'iheartpatti',
        first_name: 'Doug',
        last_name: 'Funnie'
      }
    end

    context 'with valid params' do
      it 'creates the user' do
        expect {
          post '/api/users', user: valid_params
        }.to change { User.count }.by(1)
      end

      it 'responds with a token' do
        post '/api/users', user: valid_params
        expect(json['token']).to be_present
      end
    end

    context 'with blank email and/or non-matching passwords' do
      let(:invalid_params) { {} }

      it 'does not create a user' do
        expect {
          post '/api/users', user: invalid_params
        }.to_not change { User.count }
      end
    end
  end
end
