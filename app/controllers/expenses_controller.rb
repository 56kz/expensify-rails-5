class ExpensesController < ApplicationController
  def index
    @expense = Expense.new
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

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
    # if @expense.save
    #   redirect_to expenses_path, notice: "Tu gasto fue creado con éxito"
    # else
    #   render :new
    # end
  end

  def edit
    @expense =  Expense.find(params[:id])
  end

  def update
    expense = Expense.find(params[:id])
    if expense.update(expense_params)
      redirect_to expenses_path, notice: "Tú gasto fue actualizado con éxito"
    else
      render :edit
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to expenses_path, notice: "El gasto fue eliminado con éxito"
  end

  private
    def expense_params
      params.require(:expense).permit(:date, :concept, :type, :category, :amount)
    end
end
