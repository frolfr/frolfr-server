require 'spec_helper'

describe Api::HoleStatLogsController do
  let(:user) { FactoryGirl.create(:user) }
  let!(:hole) { FactoryGirl.create(:hole) }

  describe "GET index" do
    it 'returns hole stat logs' do
      get api_hole_stat_logs_path, { format: :json, course_id: hole.course.id }, auth_header(user)

      expect(response).to be_ok
      expect(json).to have_key('hole_stat_logs')

      log_json = json['hole_stat_logs'].first
      expect(log_json['id']).to eq(hole.id)
    end
  end
end
