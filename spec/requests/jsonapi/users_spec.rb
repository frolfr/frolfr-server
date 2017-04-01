require 'spec_helper'

describe Jsonapi::UsersController do
  describe 'GET show' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'returns a user' do
      get jsonapi_user_path(user)
      expect(response).to be_ok

      expected_json = {
        'data' => {
          'id' => user.id.to_s,
          'type'=> 'users',
          'links'=> {
            'self' => "http://www.example.com/jsonapi/users/#{user.id}"
          },
          'attributes' => {
            'email' => user.email,
            'first-name' => user.first_name,
            'middle-name' => user.middle_name,
            'last-name' => user.last_name,
            'avatar-url' => user.avatar_url
          }
        }
      }

      expect(expected_json).to eq json
    end
  end

  describe 'GET index' do
    it 'returns users' do
      users = FactoryGirl.create_list(:user, 3)

      get jsonapi_users_path
      expect(response).to be_ok

      expected_ids = json['data'].map { |user_data| user_data['id'].to_i }

      expect(expected_ids).to match_array users.map(&:id)
    end
  end
end
