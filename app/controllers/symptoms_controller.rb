class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ show edit update destroy ]

  # GET /symptoms or /symptoms.json
  def index
    api = "https://www.moja-diagnoza.si/api/v1/symptoms/bodypart/"
    require 'net/http'
    require 'json'
    @symptoms = JSON.parse(Net::HTTP.get(URI(api)))
    

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symptom
      @symptom = Symptom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def symptom_params
      params.fetch(:symptom, {})
    end
end
