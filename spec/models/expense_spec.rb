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

require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:concept) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:type) }
end
