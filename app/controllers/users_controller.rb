# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    record = User.new(permitted_params)

    if record.save!
      render json: { status: 'successes', record: record }
    else
      render json: { status: record.errors.message  }
    end
  end

  def index
    user_expenses = {}

    Expense.pluck(:splitting_users_ids).each do |splitting_user_ids|
      splitting_user_ids.each do |user_id, expense_amount|
        if user_expenses[user_id]
          user_expenses[user_id] += expense_amount
        else
          user_expenses[user_id] = expense_amount
        end
      end
    end

    expense_data = user_expenses.map do |user_id, total_expense|
      user = User.find(user_id)
      { user_name: user.name, total_expense: total_expense }
    end

    render json: { expensed_data: expense_data }
  end

  def permitted_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
