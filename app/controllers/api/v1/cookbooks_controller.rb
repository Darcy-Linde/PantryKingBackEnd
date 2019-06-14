class Api::V1::CookbooksController < ApplicationController
    #before_action :authorize!, only: [:create]
    
    def index
      @cookbooks = Cookbook.where(user_id: current_user.id).as_json
      @cookbooks.map{|obj| obj[:info] = Recipe.find(obj["recipe_id"])}
      render json: @cookbooks, status: :ok
    end
  
    def create
      @existingCookbook = Cookbook.find_by(cookbook_params)
      if @existingCookbook
        render json: @existingCookbook, status: :created
      else
        @cookbook = Cookbook.new(cookbook_params)
        if @cookbook.save
          render json: @cookbook, status: :created
        else
          render json: { errors: @cookbook.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end

    def destroy
      Cookbook.find(params[:id]).destroy
    end
  
    private
    def cookbook_params
      params.permit(:user_id, :recipe_id)
    end
  end