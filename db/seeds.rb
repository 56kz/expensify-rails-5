#Iteracion entre todos los dias desde hace 6 meses hasta la fecha actual
(6.months.ago.to_date..Date.current).each do |date|
  rand(3).times do
    Expense.create!(date: date, concept: Faker::Commerce.product_name , amount: Faker::Number.between(5, 900), type: Expense.types.keys.sample, category: Expense.categories.keys.sample)
  end
end
