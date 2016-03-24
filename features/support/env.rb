require 'rubygems'
require 'bundler'
require 'yaml'
require 'spork'
require 'nokogiri'
require 'rest-client'
require 'splunk-sdk-ruby'
require 'aws-sdk-v1'
require 'fileutils'
require 'csv'
require 'mail'
require 'rubygems'
require 'digest/md5'
#UI-related
require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'uri'

begin
	puts "hi"
  #Initialising capybara
 
  Capybara.configure do |config|
    config.default_driver = :selenium
    config.run_server = false
    config.default_selector = :css
    config.default_wait_time = 10
    config.app_host = "https://fbd-dashboard.test.tools.bbc.co.uk"
  end

  $firefox_profile_location = File.dirname(__FILE__)+"/"+"vasws6rx.EndToEndTests"
  puts $firefox_profile_location
  

    if File.exists? $firefox_profile_location
      profile = Selenium::WebDriver::Firefox::Profile.new $firefox_profile_location
    else
      profile = Selenium::WebDriver::Firefox::Profile.new
    end


puts "hi"
      # Fire up the driver
      profile["browser.cache.disk.enable"] = false
      profile["browser.cache.memory.enable"] = false
      profile["app.update.auto"] = false
      profile["app.update.enabled"] = false

    #  Following two lines are required so that http_proxy set for AWS access through Ruby code does not conflict with the http_proxy used by Selenium
    proxy = Selenium::WebDriver::Proxy.new(:http => ENV['HTTP_PROXY'] || ENV['http_proxy'], :ssl => ENV['HTTPS_PROXY'] || ENV['https_proxy'])
    ENV['NO_PROXY'] = '127.0.0.1'

    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
    end


   
  #Initialising capybara
rescue Exception => e
 raise "Capybara setup failed..#{e.message}"
end