class DiagnosisController < ApplicationController
    
    def new
        @symptom = Symptom.new(symptom_params)
        raise params.inspect
    end

    private
        def set_symptom
            @symptom = Symptom.find(params[:id])
        end
end
