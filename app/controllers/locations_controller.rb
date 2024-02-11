class LocationsController < ApplicationController
  def index
    @locations = Location.all.order(name: :asc)
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
    @observations = @location.observations.order(observationDate: :desc)
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      redirect_to location_path(@location)
    else
      render :edit, status: :unprocessable_entity
    end

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
