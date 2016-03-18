class UsersController < ApplicationController
  include JqueryValidate
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.merge(company: current_company))
    #password = @user.generate_random_pass
    if @user.save
      redirect_to users_path, notice: 'Se ha añadido satisfactoriamente el nuevo usuario'
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'Se ha editado satisfactoriamente el usuario'
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  def change_password
    @user = current_user
    if @user.update(user_params)
      sign_in @user, bypass: true
      redirect_to dashboard_path, notice: 'Se ha editado satisfactoriamente la contraseña'
    else
      render :edit_password
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :last_name, :gender, :birthday, :civil_status,
                       :home_phone, :mobile_phone, :address, :last_name, :email,
                       :rut, :salary, :workstation_id, :hire_date, :password,
                       :password_confirmation, :afp, :ssp, :photo, :boss_id,
                       :dep, :region_id, :comuna_id, :contract_end_date, :street,
                       :street_num, :agreement, :admin, area_ids: [])
    end
=begin

    def company_params
      params.require(:company).permit(:id,:negative_balances, :restriction_vacation,
                                       :vacations_days, :business_name)
    end

    def update_company_user
      @company.update(company_params) && @user.send(update_method_name, user_params)
    end

    def vacations_info_params
      params.permit(:vacations_days, :limit_vacations_days)
    end

    def update_method_name
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        :update_without_password
      else
        :update
      end
    end

    def find_areas
      @areas = current_company.areas.order(:name)
    end

    def is_current_user?
      @is_current_user = (current_user.id != @user.id)
    end

    def check_password
      unless current_user.valid_password?(params[:user][:current_password])
        flash[:alert] = 'Lo sentimos, la contraseña actual es incorrecta.'
        render :edit_password
      end
    end

    def find_user
      @user = User.find(params[:id]).decorate
      if @user.nil?
        render_404
      end
    end
=end
end
