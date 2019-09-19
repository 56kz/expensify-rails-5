class ExpensesController < ApplicationController
  def index
    puts "Start: #{params[:start]}"
    puts "End: #{params[:end]}"
    @start_date = params[:start].try(:to_date)  || 30.days.ago.to_date
    @end_date = params[:end].try(:to_date) || Date.current
    range = (@start_date..@end_date)
    @expenses = Expense.where(date: range).order(date: :desc)


  end
end
