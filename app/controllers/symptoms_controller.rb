class SymptomsController < ApplicationController
  before_action :set_symptom, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
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
    def authenticate_user!
      if !user_signed_in?
        redirect_to new_user_session_path
      end
    end
    # Only allow a list of trusted parameters through.
    def symptom_params
      params.fetch(:symptom, {})
    end
end
