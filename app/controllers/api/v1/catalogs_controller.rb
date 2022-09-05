# frozen_string_literal: true

module Api
  module V1
    # PostalCodeController
    class CatalogsController < ApplicationController
      before_action :initialize_search_engine, only: %i[postal_code suburbs]

      def postal_code
        data = @search_engine.find_postal_code(params[:postal_code])
        render json: data
      end

      def suburbs
        data = @search_engine.find_suburbs_by_postal_code(params[:postal_code])
        render json: data
      end

      private

      def initialize_search_engine
        @search_engine = CatalogService.new(Copomex::Client.new(Faraday.new)).search_engine
      end
    end
  end
end
