# frozen_string_literal: true

require 'allure-rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'faker'
require 'logger'
require 'rspec'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'
require 'ostruct'
require 'yaml'
require_relative '../support/page_helper.rb'

rspec_yml = YAML.load_file("#{Dir.pwd}/support/rspec.yml")
env = YAML.load_file("#{Dir.pwd}/support/data/#{rspec_yml['environment']}.yml")

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include AllureRSpec::Adaptor
  config.include Capybara::RSpecMatchers
  config.include Pages
  config.after(:each) do |scenario|
    temp_screenshot = '/log/reports/temp_screenshoot.png'
    new_screenshot = File.new(page.save_screenshot(File.join(Dir.pwd,
                                                             temp_screenshot)))
    scenario.attach_file('screenshots', new_screenshot)
  end
end

# Escolhendo qual browser se quero chrome ou se quero firefox
# E se roda em headless ou sem headless
Capybara.register_driver :selenium do |app|
  if rspec_yml['browser'].eql?('chrome')
    if rspec_yml['headless'].eql?('headless')
      option = ::Selenium::WebDriver::Chrome::Options.new(
        args: ['--headless', '--disable-gpu', '--disable-infobars', '--window-size=1600,1024']
      )
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)
    elsif rspec_yml['headless'].eql?('no_headless')
      option = ::Selenium::WebDriver::Chrome::Options.new(
        args: ['--disable-infobars', '--window-size=1600,1024']
      )
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)
    end
    elsif rspec_yml['browser'].eql?('firefox')
    if rspec_yml['headless'].eql?('headless')
      browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
      Capybara::Selenium::Driver.new(
        app, browser: :firefox, options: browser_options
      )
    elsif rspec_yml['headless'].eql?('no_headless')
      Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
    end
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = env['url_home']
  config.default_max_wait_time = 10
end

AllureRSpec.configure do |config|
  config.output_dir = 'log/reports'
  config.clean_dir = true
  config.logging_level = Logger::WARN
end
