require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  let(:bank_account) { build(:bank_account) }

  it "is valid with valid attributes" do
    expect(bank_account).to be_valid
  end

  it "is not valid without a name" do
    bank_account.name = nil
    expect(bank_account).to_not be_valid
  end

  it "is not valid without a balance" do
    bank_account.balance = nil
    expect(bank_account).to_not be_valid
  end

  it "is not valid with a negative balance" do
    bank_account.balance = -1
    expect(bank_account).to_not be_valid
  end

  it "is not valid without a user" do
    bank_account.user = nil
    expect(bank_account).to_not be_valid
  end
end
