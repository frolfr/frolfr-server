require 'spec_helper'

describe Leaderboard do
  let(:course) { FactoryGirl.create(:course) }
  let(:round) { FactoryGirl.create(:round, course: course) }
  let(:scorecard) { FactoryGirl.create(:scorecard, round: round) }
  let!(:turn) { FactoryGirl.create(:turn, scorecard: scorecard, score: 3) }
  let(:user) { scorecard.user }

  subject(:leaderboard) { described_class.new(course) }

  context 'scorecards for a one-hole course' do
    describe '#scorecards' do
      it 'only returns scorecards from that course' do
        FactoryGirl.create(:scorecard)
        expect(subject.scorecards).to match_array [scorecard]
      end

      it 'only includes complete scorecards' do
        incomplete_scorecard = FactoryGirl.create(:scorecard, round: round)
        FactoryGirl.create(:turn, scorecard: incomplete_scorecard, score: nil)

        expect(subject.scorecards).to match_array [scorecard]
      end
    end
  end
end
