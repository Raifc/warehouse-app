class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update]

  def new
    @supplier = Supplier.new
  end

  def index
    @suppliers = Supplier.all
  end

  def show; end

  def update
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier.id), notice: 'Fornecedor atualizado com sucesso'
    else
      flash.now[:notice] = 'Não foi possivel atualizar o fornecedor'
      render 'edit'
    end
  end

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

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:corporate_name, :registration_number, :full_address, :city,
                                     :state, :email, :phone, :trade_name)
  end

end
