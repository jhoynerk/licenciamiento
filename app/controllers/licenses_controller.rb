class LicensesController < ApplicationController
  before_action :set_license, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:generate_serial, :validate_licenses, :remove_computer]
  skip_before_filter :verify_authenticity_token, :only => [:generate_serial, :validate_licenses, :remove_computer]

  # GET /licenses
  # GET /licenses.json
  def index
    @licenses = License.all
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
  end

  # GET /licenses/new
  def new
    @license = License.new
    @license.contract = Contract.new
    @license.suit = Suit.new
  end

  # GET /licenses/1/edit
  def edit
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = License.new(license_params)
    respond_to do |format|
      if @license.save
        format.html { redirect_to @license, notice: 'La Licencia fue creado con éxito!' }
        format.json { render action: 'show', status: :created, location: @license }
      else
        format.html { render action: 'new' }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licenses/1
  # PATCH/PUT /licenses/1.json
  def update
    respond_to do |format|
      if @license.update(license_params)
        format.html { redirect_to @license, notice: 'La Licencia se ha actualizado correctamente!' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license.contract.status = LicensesStatus::CANCELED
    @license.save!
    respond_to do |format|
      format.html { redirect_to licenses_url }
      format.json { head :no_content }
    end
  end

  def generate_serial
    customer = Customer.find(params[:customer_id])
    salt = bin_to_hex(customer.business_name + SecureRandom.hex(2))
    hashids = Hashids.new(salt, 20)
    hash = hashids.encode_hex(bin_to_hex(customer.rif))
    respond_to do |format|
      format.json { render json: {hash: hash, salt: salt}, status: :ok}
    end
  end

  def validate_licenses
    serial = params[:serial]
    remote_ip = request.remote_ip
    license = License.where(serial: serial).first
    if license.nil?
      message = 'Este serial no es valido.'
      valid = false
    else
      if (license.contract.status != LicensesStatus::CANCELED)
        if (license.computers_licenses.active.count < license.number_computers )
          if (license.computers_licenses.count == 0)
            license.contract.status = LicensesStatus::USED
          end
          license.computers_licenses.build(ip: remote_ip, status: ComputerStatus::ON)
          if license.save
            message = 'Ha sido activado exitosamente este serial, en este equipo.'
            valid = true
          else
            cl = ComputersLicense.where(ip: remote_ip).first
            valid = false
            if cl.status != ComputerStatus::BANEO
              if (serial == cl.license.serial)
                if cl.status == ComputerStatus::OFF
                  cl.status = ComputerStatus::ON
                  cl.save!
                  message = 'Volvimos activar este serial este equipo.'
                  valid = true
                else
                  message = 'Este serial ya se fue activado en este equipo.'
                end
              else
                message = 'Usted ya tiene otro serial activo en este equipo.'
              end
            else
              message = 'Este equipo ha sido bloqueado para asignar licencias, comuniquese con la empresa para mayor información.'
            end
          end 
        else
          message = "Usted esta al limite de equipos que puede asociar a esta licencia."
          valid = false
        end
      else
        message = "Esta licencia ha sido cancelada. Comuiquese con la empresa!"
        valid = false
      end
    end
    respond_to do |format|
      format.json { render json: {remote_ip: remote_ip, message: message, valid: valid}, status: :ok}
    end
  end

  def remove_computer
    remote_ip = request.remote_ip
    computer = ComputersLicense.where(ip: remote_ip).first
    if computer.nil?
      respond_to do |format|
        format.json { render json: {message: 'Este computador no pertenece a ninguna licencia.', valid: false}, status: :ok}
      end
    else
      if (computer.status == ComputerStatus::BANEO)
        respond_to do |format|
          format.json { render json: {message: 'Este equipo ha sido bloqueado para asignar licencias, comuniquese con la empresa para mayor información.', valid: false}, status: :ok}
        end
      else
        computer.status = ComputerStatus::OFF
        computer.save!
        respond_to do |format|
          format.json { render json: {message: 'Hemos removido este equipo del listado de computadoras para su licencia.', valid: true}, status: :ok}
        end
      end
    end
  end

  def remover_equipo
    computer = ComputersLicense.find(params[:id])
    computer.status = ComputerStatus::BANEO
    computer.save!
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Se ha removido un equipo asignado a esta licencia.!' }
      format.json { head :no_content }
    end
  end

  def reanudar_equipo
    computer = ComputersLicense.find(params[:id])
    computer.status = ComputerStatus::OFF
    computer.save!
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Se ha removido un equipo asignado a esta licencia.!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_license
      @license = License.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def license_params
      params.require(:license).permit(:type_license_id, :serial, :salt, :creation_date, :user_id, :number_computers,
                                      suit_attributes: [:customer_id, :product_id, :license_id ],
                                      contract_attributes: [:id, :contract, :status])
    end

    def bin_to_hex(s)
      s.each_byte.map { |b| b.to_s(16) }.join
    end

    def hex_to_bin(s)
     s.scan(/../).map { |x| x.hex.chr }.join
    end
end
