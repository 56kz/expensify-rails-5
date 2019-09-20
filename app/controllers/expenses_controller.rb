class ExpensesController < ApplicationController
  def index
    puts "Start: #{params[:start]}"
    puts "End: #{params[:end]}"
    puts "Type: #{params[:type]}"
    @start_date = params[:start].try(:to_date)  || 30.days.ago.to_date
    @end_date = params[:end].try(:to_date) || Date.current
    @types = params[:type]
    range = (@start_date..@end_date)

    if params[:type].nil? || params[:type].empty?
      @expenses = Expense.where(date: range).order(date: :desc)
    else
      date_array = Expense.where(date: range).order(date: :desc)
      @expenses = date_array.where(type: @types)
    end

    @num_transactions = Expense.where(date: range).count
    @total_amount = Expense.where(date: range).sum(:amount)
    @average = (@total_amount / @num_transactions).round
  end
end
