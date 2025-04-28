# frozen_string_literal: true

class Expenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :splitting_users_ids, :json, default: {}
  end
end
