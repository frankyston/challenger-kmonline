require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  describe "create User with role admin" do
    let(:user) { build(:user, :admin) }

    it "should valid user" do
      expect(user).to be_valid
      expect(user.admin?).to be_truthy
    end
  end

  describe "create User with role customer" do
    let(:user) { build(:user, :customer) }

    it "should valid user" do
      expect(user).to be_valid
      expect(user.customer?).to be_truthy
    end
  end
end
