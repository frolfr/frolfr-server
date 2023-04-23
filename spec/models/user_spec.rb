require 'rails_helper'

describe User do
  subject(:user) { FactoryBot.create(:user) }

  describe '#current_round' do
    context 'has not played any rounds' do
      it 'is nil' do
        expect(user.current_round).to be_nil
      end
    end

    context 'has played a round' do
      context 'round was played before today' do
        before do
          round = FactoryBot.create(:round, created_at: 1.days.ago)
          FactoryBot.create(:scorecard, round:, user:)
        end

        it 'is nil' do
          expect(user.current_round).to be_nil
        end
      end

      context 'round played today is complete' do
        before do
          round = FactoryBot.create(:round, created_at: 1.hour.ago)
          scorecard = FactoryBot.create(:scorecard, round:, user:)
          FactoryBot.create(:turn, scorecard:, par: 3, strokes: 1)
        end

        it 'is nil' do
          expect(user.current_round).to be_nil
        end
      end
    end

    context 'has played 3 rounds' do
      before do
        rounds = FactoryBot.create_list(:round, 2, created_at: 2.hours.ago)

        rounds.each do |round|
          scorecard = FactoryBot.create(:scorecard, round:, user:)
          FactoryBot.create(:turn, scorecard:, par: 3, strokes: nil)
        end
      end

      it 'is the most recently created incomplete round' do
        incomplete_round_played_today = FactoryBot.create(:round, created_at: 1.hour.ago)

        scorecard = FactoryBot.create(:scorecard, round: incomplete_round_played_today, user:)
        FactoryBot.create(:turn, scorecard:, par: 3, strokes: nil)

        expect(user.current_round).to eq incomplete_round_played_today
      end
    end
  end
end
