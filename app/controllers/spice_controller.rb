class SpiceController < ApplicationController
    def index 
        render json: Spice.all
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice, status: :ok
        else
            render json: {error: "spice not found"}, status: :not_found
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else   
            render json: {error: "spice not found"}, status: :not_found
        end
    end


    private

    def spice_params
        params.permit(:tittle, :image, :description, :notes, :rating)
    end

end


