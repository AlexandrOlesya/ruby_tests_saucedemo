# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Registration_saucdemo' do
  let(:browser) { create_browser :firefox }

  after do
    browser.quit
  end

  it 'does something standart user' do
    scenario = Registration.new(browser, true)

    password = scenario.password_for_registration_portal
    standart_login = scenario.login_for_registration_portal 1

    scenario.input_login standart_login
    scenario.input_password password

    scenario.autorization_portal
  end

  it 'does something problem_user' do
    scenario = Registration.new(browser, true)

    password = scenario.password_for_registration_portal
    problem_login = scenario.login_for_registration_portal 3

    scenario.input_login problem_login
    scenario.input_password password

    scenario.autorization_portal
  end

  it 'does something performance_glitch_user' do
    scenario = Registration.new(browser, true)

    password = scenario.password_for_registration_portal
    performance_login = scenario.login_for_registration_portal 4

    scenario.input_login performance_login
    scenario.input_password password

    scenario.autorization_portal
  end
end
