# frozen_string_literal: true

require_relative 'lib/autorisation'
require_relative 'image_helper'

require 'selenium-webdriver'
require 'rspec'
require 'pry'

def create_browser(browser_name)
  case browser_name
  when :firefox
    Selenium::WebDriver.for :firefox
  when :chrome
    Selenium::WebDriver.for :chrome
  else
    raise ArgumentError, "Invalid browser: #{browser_name}"
  end
end

def take_screenshot(filename)
  screenshot_name = "data/comparison_screen/#{filename}_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.png"
  @browser.save_screenshot(screenshot_name)
end

RSpec.shared_context 'browser context' do
  attr_reader :browser
end

RSpec.configure do |config|
  config.around(:each) do |example|
    @browser = create_browser(:firefox)
    @browser.navigate.to 'https://www.saucedemo.com/'

    example.run

    if example.exception
      screenshot_name = "data/errors_screen/screenshot_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.png"
      @browser.save_screenshot(screenshot_name)
    end
  ensure
    @browser&.quit
  end
end
