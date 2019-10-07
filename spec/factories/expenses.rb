FactoryBot.define do
  factory :expense do
    amount { rand(5..200) }
    category { Expense.categories.keys.sample }
    concept { Faker::Commerce.product_name }
    date { '07-10-2019' }
    type { Expense.types.keys.sample }
  end
end
