module Api
  module V1
    class PackagesController < ApplicationController
      def index
        packages = Package.all
        data = packages.map { |package| package.as_json.merge({ images: package.images.map { |image| ({ image: url_for(image) }) } }) }
        render json: { status: 'SUCCESS', message: 'Loaded Packages', data: data }, status: :ok
      end
    end
  end
end
