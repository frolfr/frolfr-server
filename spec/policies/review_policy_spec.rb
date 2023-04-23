require 'rails_helper'

describe ReviewPolicy do
  subject { described_class }
  let(:user) { FactoryBot.create(:user) }
  let(:course) { FactoryBot.create(:course) }
  let(:review) { FactoryBot.create(:review) }

  permissions :create? do
    it 'denies access if the user has never played the course' do
      expect(subject).not_to permit(user, review)
    end
  end

  permissions :update? do
    it 'denies access if the user did not write the review' do
      expect(subject).not_to permit(user, review)
    end

    it 'denies access if the user has never played the course' do
      review.update(user:)
      expect(subject).not_to permit(user, review)
    end
  end
end
