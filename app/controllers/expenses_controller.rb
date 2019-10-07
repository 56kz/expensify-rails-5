class ExpensesController < ApplicationController

  def index
    @start_date = params[:start].try(:to_date) || 30.days.ago.to_date
    @end_date = params[:end].try(:to_date) || Date.current
    @types = params[:type]
    @click_handling = params[:click_handling]
    @category = params[:category]
    @cat_handling = params[:cat_handling]
    range = (@start_date..@end_date)

    if @click_handling
      if Typehandler.last.name == @click_handling
        Typehandler.create(name: "true_no")
        @click_handling = "true_no"
        puts "desactiva clase css y "
      else
        Typehandler.create(name: @click_handling)
        puts "activa clase css"
      end
    end
    if @cat_handling
      if Cathandler.last.name == @cat_handling
         Cathandler.create(name: "true_no")
         @cat_handling = "true_no"
         puts "desactiva clase css y "
       else
         Cathandler.create(name: @cat_handling)
         puts "activa clase css"
      end
    end

    if !params[:category].present? && !params[:type].present?
      @expenses = Expense.where(date: range).order(date: :desc)
    elsif !params[:category].present? && params[:type].present?
      date_array = Expense.where(date: range).order(date: :desc)
      @expenses = date_array.where(type: @types)
    elsif params[:category].present? && !params[:type].present?
      date_array = Expense.where(date: range).order(date: :desc)
      @expenses = date_array.where(category: @category)
    else
      date_array = Expense.where(date: range).order(date: :desc)
      @expenses = date_array.where(type: @types).where(category: @category)
    end

    @total_amount = @expenses.sum(:amount)
    @num_transactions = @expenses.count
    @num_transactions == 0 ? @average = 0 : @average = (@total_amount / @num_transactions).round

  end


  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.create(expense_params)
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
