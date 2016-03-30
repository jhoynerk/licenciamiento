class TypeLicensesController < ApplicationController
  before_action :set_type_license, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /type_licenses
  # GET /type_licenses.json
  def index
    @type_licenses = TypeLicense.all
  end

  # GET /type_licenses/1
  # GET /type_licenses/1.json
  def show
  end

  # GET /type_licenses/new
  def new
    @type_license = TypeLicense.new
  end

  # GET /type_licenses/1/edit
  def edit
  end

  # POST /type_licenses
  # POST /type_licenses.json
  def create
    @type_license = TypeLicense.new(type_license_params)

    respond_to do |format|
      if @type_license.save
        format.html { redirect_to @type_license, notice: 'El Tipo de Licencia fue creado con éxito!' }
        format.json { render action: 'show', status: :created, location: @type_license }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_licenses/1
  # PATCH/PUT /type_licenses/1.json
  def update
    respond_to do |format|
      if @type_license.update(type_license_params)
        format.html { redirect_to @type_license, notice: 'El Tipo de Licencia se ha actualizado correctamente!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_licenses/1
  # DELETE /type_licenses/1.json
  def destroy
    @type_license.destroy
    respond_to do |format|
      format.html { redirect_to type_licenses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_license
      @type_license = TypeLicense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_license_params
      params.require(:type_license).permit(:name, :duration, :version, :status)
    end
end
