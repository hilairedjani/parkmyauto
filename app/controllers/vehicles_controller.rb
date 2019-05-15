class VehiclesController < ApplicationController
    def index
        
        @vehicles = Vehicle.where(:user_id => params[:user_id])
    end

    def show
        @user = current_user
        @vehicle = Vehicle.find(params[:id])
    end

    def new
        @user = current_user
        @vehicle = Vehicle.new
    end

    def edit
        @user = User.find(params[:user_id])
        @vehicle = Vehicle.find(params[:id])
    end

    def create
        @user = current_user
        @vehicle = @user.vehicles.create(vehicle_params)
        if @vehicle.errors.any?
            render :new
        else
            redirect_to user_vehicles_path(@user), notice: "Vehicle added successfully"
        end
    end

    def update
        @vehicle = Vehicle.find(params[:id])
        @vehicle.update(vehicle_params)
        if @vehicle.errors.any?
            render :new
        else
            redirect_to user_vehicle_path(@vehicle.user_id, @vehicle), notice: "Vehicle updated successfully"
        end
    end

    def destroy
        @user = current_user

        # admin can delete any vehicle
        if @user.role.admin?
            @vehicle = Vehicle.find(params[:id])
        else
            @vehicle = @user.vehicles.find(params[:id])
        end

        @vehicle.destroy

        if @user.role.admin?
            redirect_to all_vehicles_path, notice: "Vehicle deleted successfully"
        else
            redirect_to user_vehicles_path(@user), notice: "Vehicle deleted successfully"
        end

    end

    def all_vehicles 
        @user = current_user

        if @user.role.admin?
            @vehicles = Vehicle.all
        else
            redirect_to user_vehicles_path(@user)
        end
    end

    def checkout
        @user = current_user
        @vehicle = Vehicle.find(params[:id])
        @vehicle.status = true
        @vehicle.save

        redirect_to user_vehicle_path(@user, @vehicle), notice: "Vehicle has been paid for successfully"
    end

    private
        def vehicle_params
            params.require(:vehicle).permit(:license_plate, :colour, :make, :model, :year)
        end

end
