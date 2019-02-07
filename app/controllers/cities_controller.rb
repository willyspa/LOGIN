class CitiesController < ApplicationController
  def show
    @cities = City.all
    @city = City.find(params[:id])
  end
end
