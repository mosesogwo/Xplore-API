module Api
  module V1
    class WishesController < ApplicationController
      before_action :set_current_user

      def index
        wishes = @current_user.packages
        data = wishes.map { |wish| attach_images(wish) }
        render json: { status: 'SUCCESS', message: 'Loaded Wish List', data: data }, status: :ok
      end

      def create
        wish = @current_user.wishes.build(package_id: params[:id])
        if wish.save
          render json: { status: 'SUCCESS', message: 'Added to Wishes', data: wish }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Could not be added to Wishes', data: wish.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        wish = @current_user.wishes.find_by(package_id: params[:id])
        if wish
          wish.destroy
          render json: { status: 'SUCCESS', message: 'Package removed from Wishes', data: wish }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Package not on Wish List', data: [] }, status: :not_found
        end
      end

      private

      def attach_images(package)
        image_urls = package.images.map { |image| { image: url_for(image) } }
        package.as_json.merge({ images: image_urls })
      end

      def set_current_user
        if wish_params[:username] != nil
          @current_user = User.find_by(username: wish_params[:username]) || User.create(username: wish_params[:username])
        else
          render json: { status: 'ERROR', message: 'No logged in user', data: [] }, status: :internal_server_error
        end
      end

      def wish_params
        params.permit(:username, :id)
      end
    end
  end
end
