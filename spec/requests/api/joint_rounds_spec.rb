require 'spec_helper'

describe Api::JointRoundsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:friend) { FactoryGirl.create(:user) }
  let(:round) { FactoryGirl.create(:round) }

  before do
    FactoryGirl.create(:scorecard, round: round, user: user)
    FactoryGirl.create(:scorecard, round: round, user: friend)
  end

  describe "GET index" do
    let(:send_request) { get api_joint_rounds_path, { format: :json, user_id: friend.id }, auth_header(user) }

    before { send_request }

    it 'has a code of 200' do
      expect(response).to be_ok
    end

    it 'has round attributes' do
      json_round = json['joint_rounds'].first
      expect(json_round['id']).to eq round.id
      expect(json_round).to have_key 'created_at'
      expect(json_round).to have_key 'course_name'
    end
  end
end
