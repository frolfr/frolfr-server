require 'spec_helper'

describe User do
  subject(:user) { FactoryGirl.create(:user) }

  describe '#current_round' do
    context 'has not played any rounds' do
      it 'is nil' do
        expect(user.current_round).to be_nil
      end
    end

    context 'has played a round' do
      context 'round was played before today' do
        before do
          round = FactoryGirl.create(:round, created_at: 1.days.ago)
          FactoryGirl.create(:scorecard, round: round, user: user)

        end

        it 'is nil' do
          expect(user.current_round).to be_nil
        end
      end

      context 'round played today is complete' do
        before do
          round = FactoryGirl.create(:round, created_at: 1.hour.ago)
          scorecard = FactoryGirl.create(:scorecard, round: round, user: user)
          FactoryGirl.create(:turn, scorecard: scorecard, par: 3, strokes: 1)
        end

        it 'is nil' do
          expect(user.current_round).to be_nil
        end
      end
    end

    context 'has played 3 rounds' do
      before do
        rounds = FactoryGirl.create_list(:round, 2, created_at: 2.hours.ago)

        rounds.each do |round|
          scorecard = FactoryGirl.create(:scorecard, round: round, user: user)
          FactoryGirl.create(:turn, scorecard: scorecard, par: 3, strokes: nil)
        end
      end

      it 'is the most recently created incomplete round' do
        incomplete_round_played_today = FactoryGirl.create(:round, created_at: 1.hour.ago)

        scorecard = FactoryGirl.create(:scorecard, round: incomplete_round_played_today, user: user)
        FactoryGirl.create(:turn, scorecard: scorecard, par: 3, strokes: nil)

        expect(user.current_round).to eq incomplete_round_played_today
      end
    end
  end
end
