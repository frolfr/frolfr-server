require 'spec_helper'

describe Api::CoursesController do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET show" do
    let!(:course) { FactoryGirl.create(:course) }

    it 'returns a course' do
      get api_course_path(course), { format: :json }, auth_header(user)
      expect(response).to be_ok
      expect(json).to have_key('course')
      expect(json['course']['id']).to eq(course.id)
    end
  end

  describe "GET index" do
    let(:courses) { FactoryGirl.create_list(:course, 6) }
    before do
      courses.each do |course|
        round = FactoryGirl.create(:round, course: course)
        FactoryGirl.create(:scorecard, round: round, user: user)
      end
    end

    it 'returns a courses the user has played' do
      get api_courses_path, { format: :json }, auth_header(user)
      expect(response).to be_ok
      expect(json).to have_key('courses')

      course_ids = json['courses'].map { |course_json| course_json['id'] }
      expect(course_ids).to match_array Course.pluck(:id)
    end

    it 'handles pagination' do
      get api_courses_path, { format: :json, page: 1 }, auth_header(user)
      expect(response).to be_ok
      expect(json['courses'].count).to eq 5
    end
  end
end
