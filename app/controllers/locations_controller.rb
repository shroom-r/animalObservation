class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @observations = Observation.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def destroy
    Location.find(params[:id]).destroy
    redirect_to locations_url
  end

  private
    def location_params
      params.require(:location).permit(:name, :description)
    end
end
