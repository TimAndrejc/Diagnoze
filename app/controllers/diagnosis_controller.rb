class DiagnosisController < ApplicationController
    def new
        @diagnosis = params
        raise @diagnosis.inspect
    end

    private
    def diagnosis_params
        params.require(:diagnosis).permit()
    end

end
