class LicensesController < ApplicationController
  before_action :authenticate_user!
  def index
    @licenses = License.all
  end

  def new
    @license = License.new
  end

  def create
    @license = License.new(license_params.merge(company: current_company))
    #password = @license.generate_random_pass
    if @license.save
      redirect_to licenses_path, notice: 'Se ha añadido satisfactoriamente el nuevo usuario'
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @license.update(license_params)
      redirect_to licenses_path, notice: 'Se ha editado satisfactoriamente el usuario'
    else
      render :edit
    end
  end

  def delete
  end

  def show
  end

end
