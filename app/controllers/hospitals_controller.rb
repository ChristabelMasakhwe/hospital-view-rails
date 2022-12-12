class HospitalsController < ApplicationController
     wrap_parameters format:[]
    def index
        hospitals = Hospital.all
        render json: hospitals, status: :ok
    end
    def show
        hospital = Hospital.find_by(id:params[:id])
        if hospital
            render json: hospital, status: :ok, include: :patients
        else
            render json: {error: "Hospital not found"}, status: :not_found
        end
    end
    def update
        hospital = Hospital.find_by(id:params[:id])
        if hospital
            hospital.update(hospital_params)
            render json: hospital, status: :accepted
        else
            render json: {error: "Hospital not found"}, status: :not_found
        end
    end
   
    private
    def hospital_params
        params.permit(:name, :image_url, :bed_capacity, :beds_available)
    end

end
