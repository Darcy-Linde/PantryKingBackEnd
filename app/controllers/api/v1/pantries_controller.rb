class Api::V1::PantriesController < ApplicationController
    #before_action :authorize!, only: [:create]
    
    def index
      @pantries = Pantry.where(user_id: current_user.id).as_json
      @pantries.map{|obj| obj[:info] = Ingredient.find(obj["ingredient_id"])}
      render json: @pantries, status: :ok
    end
  
    def create
      @existingPantry = Pantry.find_by(user_id: params[:user_id], ingredient_id: params[:ingredient_id])
      if @existingPantry
        render json: @existingpantry, status: :created
      else
        @pantry = Pantry.new(pantry_params)
        if @pantry.save
          render json: @pantry, status: :created
        else
          render json: { errors: @pantry.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end

    def update
      Pantry.update(params[:id], pantry_params)
    end

    def destroy
      Pantry.find(params[:id]).destroy
    end
  
    private
    def pantry_params
      params.permit(:amount, :unit, :user_id, :ingredient_id)
    end

    # def index_params
    #   params.permit(:user_id)
    # end
  end