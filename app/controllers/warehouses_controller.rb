class WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save()
      redirect_to root_path, notice: 'Galpao cadastrado com sucesso'
    else
      flash.now[:notice] = 'Galpao nao cadastrado!'
      render 'new'
    end

  end

  def edit; end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to warehouse_path(@warehouse.id), notice: 'Galpao atualizado com sucesso'
    else
      flash.now[:notice] = 'Nao foi possivel atualizar o galpao'
      render 'edit'
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to root_path, notice: 'Galpao removido com sucesso'
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :code, :city, :description,
                                      :address, :zip_code, :area)
  end
end
