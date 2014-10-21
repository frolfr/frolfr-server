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
end
