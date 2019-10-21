require 'rails_helper'

describe "Expense" , type: :feature do
  it "crea un gasto y luego lo envia a expenses path" do
    driver = Selenium::WebDriver.for:chrome
    driver.get "http://localhost:3000/expenses"
    driver.find_element(:id, 'new_expense_button').click
    sleep 2
    driver.find_element(:id, 'date-field').send_keys("18-10-2019")
    driver.find_element(:id, 'concept-field').send_keys("Prueba con capybara")
    driver.find_element(:id, 'amount-field').send_keys(100)
    driver.find_element(:id, 'new_expense_submit').click
    # expect(page).to have_content('Prueba con capybara')
    # page.should have_content('Prueba con capybara')
  end
end
