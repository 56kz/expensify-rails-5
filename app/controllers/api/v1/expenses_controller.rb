class Api::V1::ExpensesController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render json: Expense.all
  end

  def create
  expense = Expense.new(expense_params)
    if expense.save
      render json: expense, status: 201
    else
      render json: { errors: expense.errors }, status: 422
    end
  end
  private
    def expense_params
      params.require(:expense).permit(:date, :concept, :type, :category, :amount)
    end
end
