class CakesController < ApplicationController

  def index
   @cakes = params[:status] == '2' ? Cake.where(status: 2) : Cake.where(status: 1)
  end

  def toggle_status
    @cake = Cake.find(params[:id])
    if @cake.status == 1
     @cake.update(status: 2)
   else
     @cake.update(status: 1)
   end
    redirect_to cakes_path
  end

  def new
   @cake = Cake.new
  end

  def edit
   @cake = Cake.find(params[:id])
  end

  def show
   @cake = Cake.find(params[:id])
  end

  def create
   Cake.create(cake_params)
   redirect_to cakes_path
  end

  def update
   cake = Cake.find(params[:id])
   cake.update(cake_params)
   redirect_to cakes_path
  end

  def destroy
   Cake.destroy(params[:id])
   redirect_to cakes_path
  end

private
 def cake_params
  params.require(:cake).permit(:name, :description, :diameter, :price, :available_until)
 end

end
