require 'rails_helper'

describe "Expense" , type: :feature do
  it "crea un gasto y luego lo envia a expenses path" do
    driver = Selenium::WebDriver.for:chrome
    driver.manage.timeouts.implicit_wait = 300
    driver.get "http://localhost:3000/expenses"
    driver.find_element(:id, 'new_expense_button').click
    driver.find_element(:id, 'new_expense_submit').click

    # wait = driver(:timeout => 10)
    # wait.until { driver.find_element(:id, 'new_expense_button').click }

    # Aqui vamos a tratar de colocar un timeout para dejar que aparezva el modal y llenarlo
  end
end
