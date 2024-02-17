class ApplicationController < ActionController::Base
  # http_basic_authenticate_with name: "admin", password: "admin"
  before_action :authenticate_user!
end
