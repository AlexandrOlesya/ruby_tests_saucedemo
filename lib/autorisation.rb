# frozen_string_literal: true

require 'page-object'

# page for registration on portal
class Autorisation
  include PageObject

  element(:password, xpath: "//div[@class = 'login_password']")
  element(:login, xpath: "//div[@class = 'login_credentials']")
  text_field(:set_login, xpath: "//input[@data-test = 'username']")
  text_field(:set_password, xpath: "//input[@data-test = 'password']")
  button(:login_button, xpath: "//input[@data-test = 'login-button']")
  element(:shopping_cart, xpath: "//div[@class = 'shopping_cart_container']")
  element(:error_message, xpath: "//div[@class = 'error-message-container error']")

  def password_for_registration_portal
    password_element.text.split(":\n")[1]
  end

  def login_for_registration_portal(num)
    login_element.text.split("\n")[num]
  end

  def input_login(login)
    set_login_element.send_keys(login)
  end

  def input_password(password)
    set_password_element.send_keys(password)
  end

  def autorization_portal
    wait_until { login_button_element.present? }
    login_button_element.click
  end

  def check_shopping_cart_visible
    shopping_cart_element.present?
  end

  def error_message_for_locked_out_user
    wait_until { error_message_element.present? }
    error_message_element.text
  end

  def check_error_message_for_locked_out_user(error_message)
    expected_error_message = 'Epic sadface: Sorry, this user has been locked out.'
    expected_error_message.eql? error_message
  end
end
