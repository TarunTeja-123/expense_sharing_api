# frozen_string_literal: true

class User < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :user_id, :integer
  end
end
