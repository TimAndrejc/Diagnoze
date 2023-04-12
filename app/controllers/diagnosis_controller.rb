class DiagnosisController < ApplicationController
    def new
        @diagnosis = params
        raise @diagnosis
        @example = '{
            "diagnoza1": "Diagnoza 1",
            "diagnoza2": "Diagnoza 2",
            "diagnoza3": "Diagnoza 3"
        }'
        data = { "messages": [{"role": "user", "content": "Predstavljaj si da si zdravnik. Pacient na predelu "+ @diagnosis['bodyPart'] + " čuti ta simptom  " + @diagnosis['symptom'] + ". Odgovori samo s tremi najbolj primernimi diagnozozami, brez opisa. Odgovori kot primer:" + @example}], "max_tokens": 256,  "model": "gpt-3.5-turbo"}
        require 'net/http'
        require 'json'
        # Set up the API endpoint URL and the API key
        url = URI("https://api.openai.com/v1/chat/completions")
        api_key = ""
        # Set up the request headers and body
        headers = { "Content-Type": "application/json", "Authorization": "Bearer #{api_key}" }
        response = Net::HTTP.post(url, data.to_json, headers)
        result = response.body
        @content = JSON.parse(result, {symbolize_names: true})[:choices][0][:message][:content]
        @content = JSON.parse(@content, {symbolize_names: true})
        raise @content
    end

    private
    def diagnosis_params
        params.require(:diagnosis).permit()
    end

end
