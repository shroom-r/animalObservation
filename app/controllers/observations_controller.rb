class ObservationsController < ApplicationController

  def new
    @location = Location.find(params[:location_id])
    @observation = Observation.new
    pp "Location: " + String(location_observations_path)
  end 

  def create
    @location = Location.find(params[:location_id])
    @observation = @location.observations.create(observation_params)
    if @observation.save
      redirect_to location_path(params[:location_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @observation = Observation.find(params[:id])
  end

  def destroy
    Observation.find(params[:id]).destroy
    redirect_to location_path(params[:location_id])
  end

  private
    def observation_params
      params.require(:observation).permit(:animalName, :description, :observationDate, :quantity)
    end
end
