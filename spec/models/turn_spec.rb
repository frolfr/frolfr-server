require 'rails_helper'

describe Turn do
  subject(:turn) { described_class.new }

  describe '#score' do
    context 'shot 3 strokes on a par 3' do
      before do
        turn.strokes = 3
        turn.par = 3
      end

      it 'has a score of 0' do
        expect(turn.score).to be_zero
      end
    end
  end
end
