class DoctorController < ApplicationController
    before_action :authenticate_user!
    def index
        @diagnoses = Diagnosis.find_by(chosen: nil)
        @symptoms = Symptom.all
    end



    private
    def authenticate_user!
        if  user_signed_in?
            if current_user.doctor != true
                redirect_to root_path
            end
        else
            redirect_to new_user_session_path
        end
    end

end