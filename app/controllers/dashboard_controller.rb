class DashboardController < ApplicationController
  
  def index    
  end

  def test
    redirect_to dashboard_path, notice: 'Solicitud enviada con exito'
  end
end
