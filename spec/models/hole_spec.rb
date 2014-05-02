require 'spec_helper'

describe Hole do
  subject(:hole) { FactoryGirl.create(:hole) }
  let(:user) { FactoryGirl.create(:user) }
  let(:scorecard) { FactoryGirl.create(:scorecard, user: user) }

  describe "#average_score" do
    it "provides the average score for all turns" do
      FactoryGirl.create(:turn, score: 3, hole: subject, scorecard: scorecard)
      FactoryGirl.create(:turn, score: 4, hole: subject, scorecard: scorecard)
      FactoryGirl.create(:turn, score: nil, hole: subject, scorecard: scorecard)
      expect(subject.average_score(user)).to eq 3.5
    end

    it "returns nil if the hole has never been played" do
      expect(subject.average_score(user)).to be_nil
    end
  end
end
