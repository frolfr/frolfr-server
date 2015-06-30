require 'spec_helper'

describe RoundPolicy do

  let(:user) { User.new }

  subject { described_class }

  permissions :destroy? do
    it "denies access if round is started" do
      round = double('Round', unstarted?: false)
      expect(subject).not_to permit(user, round)
    end

    it "denies access if user is unrelated to round" do
      round = FactoryGirl.create(:round)
      expect(subject).not_to permit(user, round)
    end

    it "grants access if round hasn't started and user is playing in round" do
      round = FactoryGirl.create(:round)
      scorecard = FactoryGirl.create(:scorecard, round: round)
      expect(subject).to permit(scorecard.user, round)
    end
  end
end
