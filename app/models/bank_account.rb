class BankAccount < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
