# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :expenses
  has_many :transactions
end
