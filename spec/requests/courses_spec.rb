require 'request_helper'

describe Api::CoursesController do
  describe "GET show" do
    let!(:course) { FactoryGirl.create(:course) }

    it 'returns a course' do
      get api_course_path(course)
      expect(response).to be_ok
      expect(json).to have_key('course')
    end
  end
end
