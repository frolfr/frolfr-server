require 'spec_helper'

describe ProfileStatLog do
  subject(:log) { described_class.new(user) }
  let(:user) { FactoryGirl.create(:user) }

  describe "top friend" do
    let(:top_friend) { FactoryGirl.create(:user) }
    let(:rounds_count) { 2 }

    before do
      rounds_count.times do
        round = FactoryGirl.create(:round)
        FactoryGirl.create(:scorecard, user: user, round: round)
        FactoryGirl.create(:scorecard, user: top_friend, round: round)
      end

      second_best_friend = FactoryGirl.create(:user)

      (rounds_count - 1).times do
        round = FactoryGirl.create(:round)
        FactoryGirl.create(:scorecard, user: user, round: round)
        FactoryGirl.create(:scorecard, user: second_best_friend, round: round)
      end
    end

    describe "#top_friend_name" do
      it 'is the top friends name' do
        expect(subject.top_friend_name).to eq top_friend.full_name
      end
    end

    describe "#top_friend_rounds_count" do
      it 'is the number of times the top friend played with the user' do
        expect(subject.top_friend_rounds_count).to eq rounds_count
      end
    end
  end

  describe "top course" do
    let(:top_course) { FactoryGirl.create(:course) }
    let(:rounds_count) { 2 }

    before do
      rounds_count.times do
        round = FactoryGirl.create(:round, course: top_course)
        FactoryGirl.create(:scorecard, user: user, round: round)
      end

      second_favorite_course = FactoryGirl.create(:course)

      (rounds_count - 1).times do
        round = FactoryGirl.create(:round, course: second_favorite_course)
        FactoryGirl.create(:scorecard, user: user, round: round)
      end
    end

    describe "#top_played_course_name" do
      it 'is the top course name' do
        expect(subject.top_played_course_name).to eq top_course.name
      end
    end

    describe "#top_played_course_scorecards_started" do
      it 'is the number of times the top course has been started by the user' do
        expect(subject.top_played_course_scorecards_started).to eq rounds_count
      end
    end
  end
end
