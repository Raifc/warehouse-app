class WarehousesController < ApplicationController

  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :code, :city, :description,
                                                         :address, :zip_code, :area)
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save()
      redirect_to root_path, notice: 'Galpao cadastrado com sucesso'
    else
      flash.now[:notice] = 'Galpao nao cadastrado!'
      render 'new'
    end

  end

end
