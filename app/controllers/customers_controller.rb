class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @user = Customer.new
  end

  def create
    @user = Customer.new(user_params.merge(company: current_company))
    #password = @user.generate_random_pass
    if @user.save
      redirect_to users_path, notice: 'Se ha añadido satisfactoriamente el nuevo usuario'
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'Se ha editado satisfactoriamente el usuario'
    else
      render :edit
    end
  end

  def delete
  end

  def show
  end

end
