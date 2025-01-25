require "rails_helper"

RSpec.describe User, type: :model do
  describe "email normalization" do
    let(:user) { build(:user) }

    before do
      user.email_address = "Some@email.locaL"
      user.save
    end

    it "normalizes the email address before saving" do
      expect(user.email_address).to eq("some@email.local")
    end
  end
end
