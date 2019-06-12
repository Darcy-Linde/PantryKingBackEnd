class Api::V1::IngredientsController < ApplicationController
    #before_action :authorize!, only: [:create]
    
    def index
      @ingredients = Ingredient.all
      render json: @ingredients, status: :ok
    end

    def show
      @ingredient = Ingredient.find(params[:id])
      render json: @ingredient, status: :ok
    end
  
    def create
      @ingredient = Ingredient.find_by(ingredient_params)
      if @ingredient
        render json: @ingredient, status: :created
      else
        @new_ingredient = Ingredient.new(ingredient_params)
        if @new_ingredient.save
          render json: @new_ingredient, status: :created
        else
          render json: { errors: @new_ingredient.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  
    private
    def ingredient_params
      params.permit(:name, :image)
    end
  end