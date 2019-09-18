class ExpensesController < ApplicationController
  def index
    # @tab = :expenses
    @expenses = Expense.all.order(data: :desc)    
  end
end
