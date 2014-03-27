require 'spec_helper'

describe Round do
  describe "completed?" do
    subject(:round) { described_class.new(scorecards: [scorecard], marked_complete: false) }
    let(:scorecard) { Scorecard.new }

    it "is completed when marked complete" do
      round.complete
      expect(round).to be_completed
    end

    it "is completed when all scorecards are complete" do
      scorecard.stub(:completed?) { true }
      expect(round).to be_completed
    end

    it "is incomplete when there is an incomplete scorecard" do
      scorecard.stub(:completed?) { false }
      expect(round).to_not be_completed
    end
  end
end
