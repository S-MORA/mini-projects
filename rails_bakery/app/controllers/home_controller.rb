class HomeController < ApplicationController
  def home
    @cakes = Cake.all
    @muffins = Muffin.all
  end
end
