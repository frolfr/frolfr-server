require 'spec_helper'

describe RoundHole do
  subject(:round_hole) { described_class.new(
    hole: hole,
    round: round
  ) }
  let!(:hole) { FactoryGirl.create(:hole) }
  let!(:round) { FactoryGirl.create(:round) }
  let!(:scorecard) { FactoryGirl.create(:scorecard, round: round) }
  let!(:turn) { FactoryGirl.create(:turn, scorecard: scorecard, hole: hole, par: 3)}

  describe 'turns' do
    it 'includes turns from that round hole' do
      expect(subject.turns).to include turn
    end

    it 'does not include turns from another hole' do
      other_turn = FactoryGirl.create(:turn, scorecard: scorecard)
      expect(subject.turns).to_not include other_turn
    end
  end

  describe "#update" do
    let(:params) do
      {
        par: 4,
        results: {
          turn.id => 3
        }
      }
    end

    it 'updates the par' do
      expect {
        subject.update(params)
        turn.reload
      }.to change { turn.par }.from(3).to(4)
    end

    it 'updates the score' do
      expect {
        subject.update(params)
        turn.reload
      }.to change { turn.score }.from(nil).to(3)
    end
  end
end
