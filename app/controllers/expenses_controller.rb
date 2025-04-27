# frozen_string_literal: true

class ExpensesController < ApplicationController
  def index
    records = Expense.all
    render json: { records: records }
  end

  def create
    record = Expense.find_or_create_by(permitted_params)
    if record.save!
      render json: { record: 'Record created successfully', status: record.errors.message }
    else
      render json: { status: record.errors.message }
    end
  end

  def permitted_params
    params.require(:expense).permit(:description, :amount, :date)
  end
end
