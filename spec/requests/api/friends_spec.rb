require 'spec_helper'

describe "Friends" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:friendships) { FactoryGirl.create_list(:friendship, 10, user: user) }

  describe "GET" do
    context "with a page parameter" do
      it "returns a single page of friends" do
        get api_friends_path, { format: :json, page: 1 }, auth_header(user)
        expect(json["friends"].length).to eq(6)
      end
    end

    context "with no page parameter" do
      it "returns all friends" do
        get api_friends_path, { format: :json }, auth_header(user)
        expect(json["friends"].length).to eq(10)
      end
    end
  end
end
