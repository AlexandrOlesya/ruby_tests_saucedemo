# frozen_string_literal: true

require 'selenium-webdriver'

def create_browser(client)
  browser ||= Selenium::WebDriver.for client
  browser
end
