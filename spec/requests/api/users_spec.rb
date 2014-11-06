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
          post '/api/users', user: valid_params, format: :json
        }.to change { User.count }.by(1)
      end

      it 'responds with a user' do
        post '/api/users', user: valid_params, format: :json
        expect(json).to have_key('user')
        expect(json['user']['first_name']).to eq('Doug')
      end
    end

    context 'with blank email and/or non-matching passwords' do
      let(:invalid_params) { {} }

      it 'does not create a user' do
        expect {
          post '/api/users', user: invalid_params, format: :json
        }.to_not change { User.count }
      end
    end
  end

  describe 'PUT /api/users/:id' do
    before { log_in(user) }
    let(:user) { FactoryGirl.create(:user) }
    let(:new_email) {'pork@chop.good.dog' }
    let(:updated_params) { { email: new_email } }

    context 'with valid params' do
      it 'updates the user' do
        put "/api/users/#{user.id}", user: updated_params, format: :json
        user.reload
        expect(user.email).to eq new_email
      end
    end
  end
end
