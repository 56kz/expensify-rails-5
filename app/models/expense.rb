# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  category   :integer
#  concept    :string
#  date       :date
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Expense < ApplicationRecord
  self.inheritance_column = nil

  enum type: [:purchase, :withdrawal, :transfer, :payment]
  enum type: [:restaurants, :grocery, :car, :services, :home, :education, :fun, :travel, :imprevist]
end
