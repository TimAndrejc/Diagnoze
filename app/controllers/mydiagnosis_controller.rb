class MydiagnosisController < ApplicationController
    before_action :authenticate_user!
    def index
        @symptoms = Symptom.all.where(user_id:current_user.id)
        @diagnoses = Diagnosis.all.where(symptoms_id:@symptoms.ids)
    end

    private
    def authenticate_user!
        if  !user_signed_in?
            redirect_to new_user_session_path
        end
    end

end