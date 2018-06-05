class MuffinsController < ApplicationController
  def index
   @muffins = Muffin.all
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
