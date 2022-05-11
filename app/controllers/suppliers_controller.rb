class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def index
    @suppliers = Supplier.all
  end

  def show; end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save()
      redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso'
    else
      flash.now[:notice] = 'Fornecedor não cadastrado!'
      render 'new'
    end
  end

  def edit; end

  def update; end

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:corporate_name, :registration_number, :full_address, :city,
                                     :state, :email, :phone, :trade_name)
  end

end
