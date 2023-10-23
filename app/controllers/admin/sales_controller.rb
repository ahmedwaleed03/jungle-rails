class Admin::SalesController < ApplicationController
  before_action :authenticate

  def index
    @sales = Sale.all
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end

end
