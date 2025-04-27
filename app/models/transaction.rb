# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :expense
  belongs_to :owed_user, class_name: 'User'
end
