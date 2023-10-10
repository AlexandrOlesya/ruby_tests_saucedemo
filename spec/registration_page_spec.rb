# frozen_string_literal: true

require_relative '../spec_helper'

RSpec.describe 'Registration saucdemo' do
  before do
    @browser = create_browser :firefox
  end

  it 'should do something standart user' do
    scenario = Registration.new(@browser, true)

    password = scenario.password_for_registration_portal
    standart_login = scenario.login_for_registration_portal 1

    scenario.input_login standart_login_1
    scenario.input_password password

    scenario.autorization_portal
  end

  it 'should do something problem_user' do
    scenario = Registration.new(@browser, true)

    password = scenario.password_for_registration_portal
    problem_login = scenario.login_for_registration_portal 3

    scenario.input_login problem_login
    scenario.input_password password

    scenario.autorization_portal
  end

  it 'should do something performance_glitch_user' do
    scenario = Registration.new(@browser, true)

    password = scenario.password_for_registration_portal
    performance_login = scenario.login_for_registration_portal 4

    scenario.input_login performance_login
    scenario.input_password password

    scenario.autorization_portal
  end

  after do
    @browser.quit
  end
end
