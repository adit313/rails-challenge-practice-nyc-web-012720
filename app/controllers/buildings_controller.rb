class BuildingsController < ApplicationController

    def index
        @buildings = Building.all.sort {|a,b| b.avail.length <=> a.avail.length}
    end

    def show
        @building = Building.find(params[:id])
        @total_rent = @building.total_rent.to_i
    end
    
    def edit
        @building = Building.find(params[:id])
    end

    def update
        @building = Building.find(params[:id])
        if @building.update(building_params)
          redirect_to @building
        else
          flash[:errors] = @building.errors.full_messages
          redirect_to edit_building_path(@building.id)
        end
    end

    def destroy
        @building = Building.find(params[:id])
        @building.destroy
        redirect_to buildings_path
    end
    
    
    private

    def building_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end

    
    

    
    
end