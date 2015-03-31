require 'spec_helper'

describe Api::HoleStatLogsController do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET show" do
    let!(:hole) { FactoryGirl.create(:hole) }

    it 'returns a hole stat log' do
      get api_hole_stat_log_path(hole), { format: :json }, auth_header(user)
      expect(response).to be_ok
      expect(json).to have_key('hole_stat_log')
      expect(json['hole_stat_log']['id']).to eq(hole.id)
    end
  end
end
