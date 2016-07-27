class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :check_auth

  def check_auth
    authenticate_or_request_with_http_basic do |username,password|
      users = ENV['USERS_ADMIN']
      users.split("|").each do |user|
        if user.split(',').first == username && user.split(',').last == password
          session['login'] = user.split(',').first
          true
        end
      end
    end
  end

end
