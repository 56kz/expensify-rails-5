module DashboardHelper
  def iterate(array)
  result = 0
  array.each do |e|
    result += e[:amount]
  end
  return result
  end

  def today_amount
    array = Expense.where("date = ?", Time.zone.today)
    iterate(array)
  end

  def yesterday_amount
    array = Expense.where("date = ?", Time.zone.yesterday)
    iterate(array)
  end

  def  actually_month_amount
    array = Expense.where("cast(strftime('%m', date) as int) = ?", Time.zone.now.strftime('%m').to_i )
    iterate(array)
  end

  def last_month_amount
    array = Expense.where("cast(strftime('%m', date) as int) = ?", (Time.zone.now.strftime('%m').to_i - 1))
    iterate(array)
  end

end
