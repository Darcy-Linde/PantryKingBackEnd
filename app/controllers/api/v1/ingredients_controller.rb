class Api::V1::IngredientsController < ApplicationController
    before_action :authorize!, only: [:create]
    
    def index
      @ingredients = Ingredient.all
      render json: @ingredients, status: :ok
    end
  
    def create
      @ingredient = Ingredient.new(ingredient_params)
      if @dog.save
        render json: @ingredient, status: :created
      else
        render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
    def ingredient_params
      params.permit(:name, :image)
    end
  end