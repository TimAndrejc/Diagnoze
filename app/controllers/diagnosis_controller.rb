class DiagnosisController < ApplicationController
    before_action :authenticate_user!

    def new
        @diagnosis = params
        @example = '{
            "diagnoza1": "Diagnoza 1",
            "diagnoza2": "Diagnoza 2",
            "diagnoza3": "Diagnoza 3"
        }'
        data = { "messages": [{"role": "user", "content": "Predstavljaj si da si zdravnik. Pacient na predelu "+ @diagnosis['bodyPart'] + " čuti ta simptom  " + @diagnosis['symptom'] + ". Odgovori samo s tremi najbolj primernimi diagnozozami, brez opisa. Odgovori kot primer:" + @example}], "max_tokens": 512,  "model": "gpt-3.5-turbo"}
        require 'net/http'
        require 'json'
        # Set up the API endpoint URL and the API key
        url = URI("https://api.openai.com/v1/chat/completions")
        api_key = "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"
        # Set up the request headers and body
        headers = { "Content-Type": "application/json", "Authorization": "Bearer #{api_key}" }
        response = Net::HTTP.post(url, data.to_json, headers)
        result = response.body
        @content = JSON.parse(result, {symbolize_names: true})[:choices][0][:message][:content]
        @content = JSON.parse(@content, {symbolize_names: true})   
        @symptoms = Symptom.new
        @symptoms.allsymptoms = @diagnosis['symptoms']
        @symptoms.bodyparts = @diagnosis['bodyPart']
        @symptoms.user_id = current_user.id
        @symptoms.save
        @diagnose = Diagnosis.new
        @diagnose.all = @content
        @diagnose.symptoms_id = @symptoms.id
        @diagnose.save
        redirect_to root_path
    end

    private

    def authenticate_user!
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
    def diagnosis_params
        params.require(:diagnosis).permit()
    end

end
