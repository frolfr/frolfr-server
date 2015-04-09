require 'spec_helper'

describe CourseHolesStatLog do
  subject(:log) { described_class.new(user: user, course: course) }

  let(:course) { FactoryGirl.create(:course) }
  let(:user) { FactoryGirl.create(:user) }

  let(:tough_hole) { FactoryGirl.create(:hole, course: course) }
  let(:easy_hole_1) { FactoryGirl.create(:hole, course: course) }
  let(:easy_hole_2) { FactoryGirl.create(:hole, course: course) }

  before do
    FactoryGirl.create(:turn, hole: tough_hole, strokes: 4, par: 3, scorecard: FactoryGirl.create(:scorecard, user: user))
    FactoryGirl.create(:turn, hole: easy_hole_1, strokes: 2, par: 3, scorecard: FactoryGirl.create(:scorecard, user: user))
    FactoryGirl.create(:turn, hole: easy_hole_2, strokes: 2, par: 3, scorecard: FactoryGirl.create(:scorecard, user: user))
  end

  describe '#assign_hole_rankings' do
    describe '#hole_stat_rankings' do
      it 'assigns the easy holes each a ranking of 1' do
        easy_hole_1_log = subject.hole_stat_logs.find { |log| log.hole == easy_hole_1 }
        easy_hole_2_log = subject.hole_stat_logs.find { |log| log.hole == easy_hole_2 }

        expect(easy_hole_1_log.ranking).to eq 1
        expect(easy_hole_2_log.ranking).to eq 1
      end

      it 'assigns the tough hole a ranking of 2' do
        tough_hole_log = subject.hole_stat_logs.find { |log| log.hole == tough_hole }
        expect(tough_hole_log.ranking).to eq 2
      end
    end
  end
end
