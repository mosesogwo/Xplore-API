module Api
  module V1
    class WishesController < ApplicationController
      before_action :set_current_user

      def index
        wishes = @current_user.packages
        render json: {status: 'SUCCESS', message: 'Loaded Wish List', data: wishes}, status: :ok
      end

      private

      def set_current_user
        if wish_params[:username] != nil
          @current_user = User.find_by(username: wish_params[:username])  || User.create(username: wish_params[:username])
        else
          render json: {status: 'ERROR', message: 'No logged in user', data:[]}, status: :internal_server_error
        end
      end 

      def wish_params
        params.permit(:username)
      end
    end
  end
end