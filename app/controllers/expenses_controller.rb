# frozen_string_literal: true

class ExpensesController < ApplicationController
  def index
    records = Expense.all
    render json: { records: records }
  end

  def permitted_params
    params.require(:expense).permit(:description, :amount, :date, :user_id, splitting_users_ids: {}, user_ids: [])
  end

  def create
    permitted = permitted_params

    record = Expense.find_or_create_by(description: permitted[:description], amount: permitted[:amount],
                                       date: permitted[:date], user_id: permitted[:user_id])

    if permitted[:splitting_users_ids].present? && (permitted[:splitting_users_ids]&.values&.sum != permitted[:amount])
      render json: { status: 'error', message: 'Amount does not match the splitting sum' }
      return
    end
    if permitted[:user_ids].present?
      split_amount = permitted[:amount] / permitted[:user_ids].size
      splitting_users_ids = permitted[:user_ids].each_with_object({}) do |user_id, hash|
        hash[user_id.to_s] = split_amount
      end
      record.splitting_users_ids = splitting_users_ids
    end

    if record.save
      render json: { record: record, status: 'success' }
    else
      render json: { status: 'error', message: record.errors.full_messages }
    end
  end
end
