require 'spec_helper'

describe Jsonapi::CoursesController do
  describe 'GET show' do
    let!(:course) { FactoryGirl.create(:course) }

    it 'returns a course' do
      get jsonapi_course_path(course)
      expect(response).to be_ok

      expected_json = {
        'data' => {
          'id' => course.id.to_s,
          'type'=> 'courses',
          'links'=> {
            'self' => "http://www.example.com/jsonapi/courses/#{course.id}"
          },
          'attributes' => {
            'city' => course.city,
            'state' => course.state,
            'name' => course.name,
            'country' => course.country,
            'hole-count' => course.hole_count
          }
        }
      }

      expect(expected_json).to eq json
    end
  end

  describe 'GET index' do
    it 'returns courses' do
      courses = FactoryGirl.create_list(:course, 3)

      get jsonapi_courses_path
      expect(response).to be_ok

      expected_ids = json['data'].map { |course_data| course_data['id'].to_i }

      expect(expected_ids).to match_array courses.map(&:id)
    end

    it 'paginates' do
      courses = FactoryGirl.create_list(:course, 15)

      get jsonapi_courses_path
      expect(response).to be_ok

      expected_courses = json['data'].count

      expect(expected_courses).to eq 10

      get jsonapi_courses_path, { page: { number: 2 } }
      expect(response).to be_ok

      expected_courses = json['data'].count

      expect(expected_courses).to eq 5
    end
  end
end
