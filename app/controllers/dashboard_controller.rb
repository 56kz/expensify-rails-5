class DashboardController < ApplicationController
  def index
    @tab = :dashboard
    @actually_month = Expense.where("cast(strftime('%m', date) as int) = ?", Time.zone.now.strftime('%m').to_i )
    @last_month = Expense.where("cast(strftime('%m', date) as int) = ?", (Time.zone.now.strftime('%m').to_i - 1))

    @monthly_data = Expense.types.keys.map do |type|
      { name: type.capitalize, data: Expense.where(type: type).group_by_month(:date).sum(:amount) }
    end

    @daily_data = Expense.types.keys.map do |type|
      { name: type.capitalize, data: @actually_month.where(type: type).group_by_day(:date).sum(:amount) }
    end

    @categories_data = @actually_month.group(:type).sum(:amount)
    @comparation_data = Expense.group(:type).sum(:amount)
  end
end
