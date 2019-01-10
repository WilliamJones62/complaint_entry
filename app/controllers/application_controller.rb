class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :current_part

  def current_invoice
    session[:invoice_id] ||= []
  end

  def current_part
    session[:part_id] ||= []
  end

  def current_issue
    session[:issue_id] ||= []
  end
end
