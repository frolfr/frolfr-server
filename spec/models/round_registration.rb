require 'spec_helper'

describe RoundRegistration do
  let(:course) { FactoryGirl.create(:course) }
  let(:users) { [FactoryGirl.create(:user), FactoryGirl.create(:user)] }
  subject(:round_registration) { described_class.new(course: course, users: users) }

  before do
    1.upto(3) do |i|
      FactoryGirl.create(:hole, course: course)
    end
  end

  context "a two player, three hole course" do
    describe "#create_round" do
      it "creates as six turns" do
        expect {
          subject.create_round
        }.to change(Turn, :count).by(6)
      end

      it "creates two scorecards" do
        expect {
          subject.create_round
        }.to change(Scorecard, :count).by(2)
      end

      it "creates one round" do
        expect {
          subject.create_round
        }.to change(Round, :count).by(1)
      end
    end
  end
end
