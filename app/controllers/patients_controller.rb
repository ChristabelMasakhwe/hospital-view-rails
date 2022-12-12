class PatientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    wrap_parameters format:[]

    def create
        patient = Patient.create!(patient_params)
        session[:patient_id] = patient.id
          render json: patient, status: :created
    end
    def show
        patient = Patient.find_by(id:session[:patient_id])
        if patient
            render json: patient, status: :ok
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
        
    end
    private
    def patient_params
        params.permit(:name, :email, :password)
    end
    def render_unprocessable_entity(e)
        render json: {error: e.record.errors.full_messages}, status: :unprocessable_entity
    end
    
end
