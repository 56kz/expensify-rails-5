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
    array = Expense.where(date: '2019-10-01'..'2019-10-31')
    iterate(array)
  end

  def last_month_amount
    array = Expense.where(date: '2019-09-01'..'2019-09-30')   
    iterate(array)
  end

end
