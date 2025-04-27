# frozen_string_literal: true

class Expense < ApplicationRecord
  belongs_to :user
  has_many :transactions
end
