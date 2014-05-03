require 'spec_helper'

describe HoleStats do
  subject(:hole_stats) { described_class.new(
    hole: hole,
    user: user
  ) }
  let(:hole) { FactoryGirl.create(:hole) }
  let(:user) { FactoryGirl.create(:user) }
  let(:scorecard) { FactoryGirl.create(:scorecard, user: user) }

  describe "#average_score" do
    it "provides the average score for all turns" do
      FactoryGirl.create(:turn, score: 3, hole: hole, scorecard: scorecard)
      FactoryGirl.create(:turn, score: 4, hole: hole, scorecard: scorecard)
      FactoryGirl.create(:turn, score: nil, hole: hole, scorecard: scorecard)
      expect(subject.average_score).to eq 3.5
    end

    it "returns nil if the hole has never been played" do
      expect(subject.average_score).to be_nil
    end
  end

  describe "#average_par" do
    it "provides the average score for all turns" do
      FactoryGirl.create(:turn, score: 3, par: 3, hole: hole, scorecard: scorecard)
      FactoryGirl.create(:turn, score: 3, par: 4, hole: hole, scorecard: scorecard)
      FactoryGirl.create(:turn, score: nil, par: 5, hole: hole, scorecard: scorecard)
      expect(subject.average_par).to eq 3.5
    end

    it "returns nil if the hole has never been played" do
      expect(subject.average_par).to be_nil
    end
  end
end
