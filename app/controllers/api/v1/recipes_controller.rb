class Api::V1::RecipesController < ApplicationController
    #before_action :authorize!, only: [:create]
    
    def index
      @recipes = Recipe.all
      render json: @recipes, status: :ok
    end
  
    def create
      @recipe = Recipe.find_by(recipe_params)
      if @recipe
        render json: @recipe, status: :created
      else
        @new_recipe = Recipe.new(recipe_params)
        if @new_recipe.save
          render json: @new_recipe, status: :created
        else
          render json: { errors: @new_recipe.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  
    private
    def recipe_params
      params.permit(
          :api_id, 
          :title, 
          :image, 
          :instructions, 
          :servings, 
          :preparation_minutes, 
          :cooking_minutes, 
          :ready_in_minutes, 
          :price_per_serving, 
          :source_url, 
          :vegetarian, 
          :vegan, 
          :gluten_free, 
          :dairy_free)
    end
  end