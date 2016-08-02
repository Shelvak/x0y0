ENV["RAILS_ENV"] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'sidekiq/testing/inline'
require 'database_cleaner'
require 'minitest/reporters'
require 'capybara-screenshot/minitest'

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

class ActiveSupport::TestCase
	ActiveRecord::Migration.maintain_test_schema!
	# set_fixture_class versions: PaperTrail::Version

	fixtures :all

  def error_message_from_model(model, attribute, message, extra = {})
    ::ActiveModel::Errors.new(model).generate_message(attribute, message, extra)
  end

  def assert_equal_messages(instance, attr, validate, extra = {})
    assert_equal [error_message_from_model(instance, attr, validate, extra)],
      instance.errors[attr], attr
  end
end

class ActionController::TestCase
  include Devise::Test::ControllerHelpers
end

# Transactional fixtures do not work with Selenium tests, because Capybara
# uses a separate server thread, which the transactions would be hidden
# from. We hence use DatabaseCleaner to truncate our test database.
DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Screenshot::MiniTestPlugin

  # Transactional fixtures do not work with Selenium tests, because Capybara
  # uses a separate server thread, which the transactions would be hidden
  # from. We hence use DatabaseCleaner to truncate our test database.
  DatabaseCleaner.strategy = :truncation
  # Stop ActiveRecord from wrapping tests in transactions

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara::Screenshot.webkit_options = { width: 1024, height: 768 }
	Capybara::Screenshot.class_eval do
		register_driver(:chrome) do |driver, path|
			driver.browser.save_screenshot(path)
		end
	end

  setup do
    Capybara.javascript_driver = ENV['USE_CHROME'] ? :chrome : :selenium
    Capybara.current_driver = Capybara.javascript_driver # :selenium by default
    Capybara.server_port = '54163'
    Capybara.app_host = 'http://localhost:54163'
    Capybara.reset!    # Forget the (simulated) browser state
    Capybara.default_max_wait_time = 4
  end

  teardown do
    DatabaseCleaner.clean       # Truncate the database
    Capybara.reset!             # Forget the (simulated) browser state
  end

  def login
    user = Fabricate(:user, password: '123456')

    visit new_user_session_path

    assert_page_has_no_errors!

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '123456'

    find('input.btn').click

    assert_equal users_path, current_path

    assert_page_has_no_errors!
    assert page.has_css?('.alert.alert-info')

    within '.alert.alert-info' do
      assert page.has_content?(I18n.t('devise.sessions.signed_in'))
    end
  end

  def assert_page_has_no_errors!
    assert page.has_no_css?('#unexpected_error')
  end
end
