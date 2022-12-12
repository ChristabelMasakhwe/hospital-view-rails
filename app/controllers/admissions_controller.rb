class AdmissionsController < ApplicationController
    wrap_parameters format:[]
    def index 
        admissions = Admission.all
        render json: admissions, status: :ok
    end
    
    def create
        admission = Admission.create!(admission_params)
        render json: admission, status: :created
    end
    
    def destroy
        admission = Admission.find_by(id:params[:id])
        if admission
            admission.destroy
            head :no_content
        else
            render json: {error: "Admission not found"}, status: :not_found
        end
    end
    private
    def admission_params
        params.permit(:name, :condition, :date, :patient_id, :hospital_id)
    end
end
