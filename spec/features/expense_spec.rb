require 'rails_helper'

describe "Expense" , type: :feature do
  it "crea un gasto y luego lo envia a expenses path" do
    driver = Selenium::WebDriver.for:chrome
    driver.get "http://localhost:3000/expenses"
    driver.find_element(:id, 'new_expense_button').click
  end
end
