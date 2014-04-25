require 'spec_helper'

describe RoundRegistration do
  let(:course) { FactoryGirl.create(:course) }
  let(:users) { FactoryGirl.create_list(:user, user_count) }
  subject(:round_registration) { described_class.new(course: course, users: users) }

  before do
    hole_count.times do
      FactoryGirl.create(:hole, course: course)
    end
  end

  let(:user_count) { 2 }
  let(:hole_count) { 3 }

  context "a two player, three hole course" do
    describe "#create_round" do
      it "creates six turns" do
        turn_count = user_count * hole_count

        expect {
          subject.create_round
        }.to change(Turn, :count).by(turn_count)
      end

      it "creates two scorecards" do
        expect {
          subject.create_round
        }.to change(Scorecard, :count).by(user_count)
      end

      it "creates one round" do
        expect {
          subject.create_round
        }.to change(Round, :count).by(1)
      end
    end
  end
end
