class Api::V1::ExpensesController < ApplicationController
  def index
    render json: Expense.all
  end
end
