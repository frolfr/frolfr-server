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
          },
          'relationships' => {
            'scorecards'=> {
              'links' => {
                'self' => 'http://www.example.com/jsonapi/users/1/relationships/scorecards',
                'related'=> 'http://www.example.com/jsonapi/users/1/scorecards'
              }
            }
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

    it 'filters by first, middle, and last name, regardless of case' do
      paul = FactoryGirl.create(:user, first_name: 'Paul', last_name: 'McBeth')
      simon = FactoryGirl.create(:user, first_name: 'Simon', last_name: 'Lizotte')
      eagle = FactoryGirl.create(:user, first_name: 'Eagle', last_name: 'McMahon')

      get jsonapi_users_path, { filter: { name: 'mc' } }
      expect(response).to be_ok

      expected_ids = json['data'].map { |user_data| user_data['id'].to_i }

      expect(expected_ids).to match_array [paul.id, eagle.id]
    end
  end
end
