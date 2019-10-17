# require 'selenium-webdriver'
require 'rails_helper'

# driver = Selenium::WebDriver.for:chrome
# driver.get "http://google.com"


describe "Expense" , type: :feature do
  it "crea un gasto y luego lo envia a expenses path" do
    visit "/expenses"
  end
end
