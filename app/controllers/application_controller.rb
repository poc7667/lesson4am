class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
      msg = '權限不足,請先註冊測試者帳號,點選頁面上方 Sign Up 。若已經登入則代表您的權限不足'
      flash.keep[:error] = msg
      redirect_to new_user_session_url
    end

  add_flash_types :error, :another_custom_type
end
