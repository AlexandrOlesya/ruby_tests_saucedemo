# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Registration_saucdemo' do
  let(:browser) { create_browser :firefox }

  after do
    browser.quit
  end

  it 'does something standart user' do
    scenario = Autorisation.new(browser, true)

    password = scenario.password_for_registration_portal
    standart_login = scenario.login_for_registration_portal 1

    scenario.input_login standart_login
    scenario.input_password password

    scenario.autorization_portal

    expect(scenario.check_shopping_cart_visible).to be(true)
  end

  it 'does something problem_user' do
    scenario = Autorisation.new(browser, true)

    password = scenario.password_for_registration_portal
    problem_login = scenario.login_for_registration_portal 3

    scenario.input_login problem_login
    scenario.input_password password

    scenario.autorization_portal

    expect(scenario.check_shopping_cart_visible).to be(true)
  end

  it 'does something performance_glitch_user' do
    scenario = Autorisation.new(browser, true)

    password = scenario.password_for_registration_portal
    performance_login = scenario.login_for_registration_portal 4

    scenario.input_login performance_login
    scenario.input_password password

    scenario.autorization_portal

    expect(scenario.check_shopping_cart_visible).to be(true)
  end

  it 'does something locked_out_user' do
    scenario = Autorisation.new(browser, true)

    password = scenario.password_for_registration_portal
    locked_login = scenario.login_for_registration_portal 2

    scenario.input_login locked_login
    scenario.input_password password

    scenario.autorization_portal

    error_message = scenario.error_message_for_locked_out_user
    expect(scenario.check_error_message_for_locked_out_user(error_message)).to be(true)
  end
end
