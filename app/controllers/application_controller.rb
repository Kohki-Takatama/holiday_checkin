class ApplicationController < ActionController::Base
  add_flash_types :error, :info, :warning, :success
end
