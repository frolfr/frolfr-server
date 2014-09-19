require 'spec_helper'

describe Scorecard do
  describe "#completed?" do
    let(:scorecard) { described_class.new(turns: [turn]) }
    let(:turn) { Turn.new }

    it "is completed when all turns are played" do
      turn.stub(:played?) { true }
      expect(scorecard).to be_completed
    end

    it "is incomplete when any turns are unplayed" do
      turn.stub(:played?) { false }
      expect(scorecard).to_not be_completed
    end
  end

  describe '#turn_for_hole' do
    let(:round) { FactoryGirl.create(:round) }
    let(:scorecard) { FactoryGirl.create(:scorecard, round: round) }
    let(:hole) { FactoryGirl.create(:hole, course: round.course) }

    it 'finds the turn' do
      turn = FactoryGirl.create(:turn, hole: hole, scorecard: scorecard)
      expect(scorecard.turn_for_hole(hole)).to eq turn
    end
  end
end
