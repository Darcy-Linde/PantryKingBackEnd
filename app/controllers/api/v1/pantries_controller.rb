class Api::V1::PantriesController < ApplicationController
    #before_action :authorize!, only: [:create]
    
    def index
      @pantries = Pantry.all
      render json: @pantries, status: :ok
    end
  
    def create
      @pantry = Pantry.new(pantry_params)
      if @pantry.save
        render json: @pantry, status: :created
      else
        render json: { errors: @pantry.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
    def pantry_params
      params.permit(:amount, :unit, :user_id, :ingredient_id)
    end
  end