class MuffinsController < ApplicationController
  def index
   @muffins = params[:status] == '2' ? Muffin.where(status: 2) : Muffin.where(status: 1)
  end

  def toggle_status
    @muffin = Muffin.find(params[:id])
    if @muffin.status == 1
      @muffin.update(status: 2)
    else
      @muffin.update(status: 1)
    end
    redirect_to muffins_path
  end
  
    def new
     @muffin = Muffin.new
    end
    def edit
     @muffin = Muffin.find(params[:id])
    end
    def show
     @muffin = Muffin.find(params[:id])
    end
    def create
     Muffin.create(muffin_params)
     redirect_to muffins_path
    end
    def update
     muffin = Muffin.find(params[:id])
     muffin.update(muffin_params)
     redirect_to muffins_path
    end
   def destroy
    Muffin.destroy(params[:id])
    redirect_to muffins_path
    end
  private
   def muffin_params
    params.require(:muffin).permit(:name, :description, :category, :price, :available_until)
   end

end
