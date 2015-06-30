require 'spec_helper'

describe TurnPolicy do
  subject { described_class }

  permissions :update? do
    let(:user_in_turn) { FactoryGirl.create(:user) }
    let(:user_in_round) { FactoryGirl.create(:user) }
    let(:unrelated_user) { FactoryGirl.create(:user) }

    let(:round) { FactoryGirl.create(:round) }

    let!(:users_turn_scorecard) { FactoryGirl.create(:scorecard, user: user_in_turn, round: round)}
    let(:turn) { FactoryGirl.create(:turn, scorecard: users_turn_scorecard) }

    let!(:user_in_round_scorecard) { FactoryGirl.create(:scorecard, user: user_in_round, round: round)}

    it "grants access if user's turn" do
      expect(subject).to permit(user_in_turn, turn)
    end

    it "grants access if user is in round" do
      expect(subject).to permit(user_in_round, turn)
    end

    it "denies access if user is unrelated" do
      expect(subject).not_to permit(unrelated_user, turn)
    end
  end
end
