class Payment < ApplicationRecord
  has_many :transactions
  accepts_nested_attributes_for :transactions, allow_destroy: true
end
