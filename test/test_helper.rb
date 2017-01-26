ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

#Inside intgreation test, session can't be manipulated directly, but can post to the sessions path, which leads to the log_in_as method
class ActionDispatch::IntegrationTest
#Lets using code from a controller test in an integreation without making any change to the login method

  #Log in as a particular user
  def log_in_as(user, password: '123greetings', remember_me: '1')
    post user_session_path, params: { session: {email: user.email,
                                         password: password,
                                         remember_me: remember_me}}
    #binding.pry
  end
end
