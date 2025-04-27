# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :description
      t.decimal :amount
      t.datetime :date

      t.timestamps
    end
  end
end
