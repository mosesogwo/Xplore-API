module Api
  module V1
    class PackagesController < ApplicationController
      def index
        packages = Package.all
        data = packages.map { |package| attach_images(package) }
        render json: { status: 'SUCCESS', message: 'Loaded Packages', data: data }, status: :ok
      end

      private

      def attach_images(package)
        package.as_json.merge(image: url_for(package.image))
      end
    end
  end
end
