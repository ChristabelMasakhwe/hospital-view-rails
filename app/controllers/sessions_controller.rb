class SessionsController < ApplicationController
    def create
        patient = Patient.find_by(name: params[:name])
        if patient&.authenticate(params[:password])
          session[:patient_id] = patient.id
          render json: patient, status: :created
        # rescue ActiveRecord::RecordInvalid => e
        #     render json: {error: e.record.errors.full_messages}, status: :unprocessable_entity
        else
            render json: { error: {login: "Invalid username or password" }}, status: :unauthorized
        end
    end
    def destroy
        session.delete :patient_id
        head :no_content
    end
  
end
