# frozen_string_literal: true

class ExpensesAddUserIds < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :user_ids, :json, default: []
  end
end
