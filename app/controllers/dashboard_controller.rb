class DashboardController < ApplicationController
  before_action :authenticate_user!  
  def index
    @products = Product.last(8)
    @licenses = License.last(8)
    @customers = Customer.last(8)
  end

  def test
    redirect_to dashboard_path
  end
end

