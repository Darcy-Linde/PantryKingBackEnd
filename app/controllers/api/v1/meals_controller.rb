class Api::V1::MealsController < ApplicationController
    #before_action :authorize!, only: [:create]
    
    def index
      @meals = Meal.where(user_id: current_user.id)
      render json: @meals, status: :ok
    end
  
    def create
      @meal = Meal.new(meal_params)
      if @meal.save
        render json: @meal, status: :created
      else
        render json: { errors: @meal.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      Meal.find(params[:id]).destroy
    end
  
    private
    def meal_params
      params.permit(:user_id, :image, :title, :api_id, :date)
    end
  end