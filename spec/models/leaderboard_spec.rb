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

      it 'orders scorecards by score' do
        worst_scorecard = FactoryGirl.create(:scorecard, round: round)
        FactoryGirl.create(:turn, scorecard: worst_scorecard, score: 5)

        best_scorecard = FactoryGirl.create(:scorecard, round: round)
        FactoryGirl.create(:turn, scorecard: best_scorecard, score: 1)

        expect(subject.scorecards).to match_array Scorecard.all
        expect(subject.scorecards.first).to eq best_scorecard
        expect(subject.scorecards.last).to eq worst_scorecard
      end

      context 'uniqueness by user' do
        it 'returns the better scorecard' do
          best_round = FactoryGirl.create(:round, course: course)
          best_scorecard = FactoryGirl.create(:scorecard, user: user, round: round)
          FactoryGirl.create(:turn, scorecard: best_scorecard, score: 1)

          expect(subject.scorecards).to match_array [best_scorecard]
        end
      end

      it 'is limited to 10 scorecards' do
        FactoryGirl.create_list(:scorecard, 11, round: round)
        expect(subject.scorecards.count).to eq 10
      end
    end
  end
end
