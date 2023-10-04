require 'rails_helper'
RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_many(:journal_entries) }
  end

  describe "validations" do
    subject { FactoryBot.build(:user) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should allow_value("user@example.com").for(:email) }
    it { should_not allow_value("invalid_email").for(:email) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end
end
