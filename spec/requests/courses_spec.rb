require 'request_helper'

describe Api::CoursesController do
  before { log_in }

  describe "GET show" do
    let!(:course) { FactoryGirl.create(:course) }

    it 'returns a course' do
      get api_course_path(course), format: :json
      expect(response).to be_ok
      expect(json).to have_key('course')
      expect(json['course']['id']).to eq(course.id)
    end
  end
end
