# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    record = User.new(permitted_params)

    if record.save!
      render json: { status: 'successes', record: record }
    else
      render json: { status: record.errors.message }
    end
  end

  def permitted_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
