class PlantsController < ApplicationController
    wrap_parameters format: []

    #Gets all plants
    def index
        render json: Plant.all, status: :ok
    end

    #Get plant by id
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "Plant with id #{params[:id]}, not found"}, status: :not_found
        end
    end

    # create method
    def create
        render json: Plant.create(plant_params), status: :created
    end


    private
    def plant_params
      params.permit(:name, :image, :price)
    end
end
