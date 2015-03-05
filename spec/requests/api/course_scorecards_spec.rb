require 'spec_helper'

describe Api::CourseScorecardsController do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET index" do
    let(:course) { FactoryGirl.create(:course) }
    let(:round) { FactoryGirl.create(:round, course: course) }
    let!(:scorecard) { FactoryGirl.create(:scorecard, round: round, user: user) }
    let(:send_request) { get api_course_scorecards_path, { format: :json, course_id: course.id }, auth_header(user) }

    before { send_request }

    it 'has a code of 200' do
      expect(response).to be_ok
    end

    it 'has scorecard attributes' do
      json_scorecard = json['course_scorecards'].first
      expect(json_scorecard['id']).to eq scorecard.id
      expect(json_scorecard).to have_key 'total_score'
      expect(json_scorecard).to have_key 'total_shooting'
      expect(json_scorecard).to have_key 'created_at'
      expect(json_scorecard).to have_key 'round_id'
      expect(json_scorecard).to have_key 'is_completed'
    end
  end
end
