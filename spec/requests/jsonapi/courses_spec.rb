# frozen_string_literal: true

require 'rails_helper'

describe Jsonapi::CoursesController do
  describe 'GET show' do
    let(:course) { FactoryBot.create(:course) }
    before do
      FactoryBot.create_list(:hole, 3, course:)
    end

    it 'returns a course' do
      get jsonapi_course_path(course)
      expect(response).to be_ok

      expected_json = {
        'data' => {
          'id' => course.id.to_s,
          'type' => 'courses',
          'links' => {
            'self' => "http://www.example.com/jsonapi/courses/#{course.id}"
          },
          'attributes' => {
            'city' => course.city,
            'state' => course.state,
            'name' => course.name,
            'country' => course.country,
            'holes-count' => 3
          },
          'relationships' => {
            'rounds' => {
              'links' => {
                'self' => "http://www.example.com/jsonapi/courses/#{course.id}/relationships/rounds",
                'related' => "http://www.example.com/jsonapi/courses/#{course.id}/rounds"
              }
            },
            'submitter' => {
              'links' => {
                'self' => "http://www.example.com/jsonapi/courses/#{course.id}/relationships/submitter",
                'related' => "http://www.example.com/jsonapi/courses/#{course.id}/submitter"
              }
            }
          }
        }
      }

      expect(json).to eq expected_json
    end
  end

  describe 'GET index' do
    it 'returns courses' do
      courses = FactoryBot.create_list(:course, 3)

      get jsonapi_courses_path
      expect(response).to be_ok

      expected_ids = json['data'].map { |course_data| course_data['id'].to_i }

      expect(expected_ids).to match_array courses.map(&:id)
    end

    it 'paginates' do
      FactoryBot.create_list(:course, 15)

      get jsonapi_courses_path
      expect(response).to be_ok

      expected_courses = json['data'].count

      expect(expected_courses).to eq 10

      get jsonapi_courses_path, params: { page: { number: 2 } }
      expect(response).to be_ok

      expected_courses = json['data'].count

      expect(expected_courses).to eq 5
    end
  end

  describe 'POST create' do
    let!(:course) { FactoryBot.create(:course) }
    let!(:user) { FactoryBot.create(:user) }

    it 'returns a course' do
      course = FactoryBot.build(:course)
      user = User.first
      token = JsonWebToken.encode(user_id: user.id)

      request = {
        'data' => {
          'type' => 'courses',
          'attributes' => {
            'city' => course.city,
            'state' => course.state,
            'name' => course.name,
            'country' => course.country
          },
          'relationships' => {
            'submitter' => {
              'data' => {
                'type' => 'users',
                'id' => user.id
              }
            }
          }
        }
      }

      post jsonapi_courses_path, params: request.to_json,
                                 headers: { 'Content-Type' => 'application/vnd.api+json', 'Authorization' => "Bearer #{token}" }

      expect(response).to be_created
    end
  end
end
