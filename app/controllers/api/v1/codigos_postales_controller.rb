# frozen_string_literal: true

module Api
  module V1
    # Código postal API
    class CodigosPostalesController < ApplicationController
      def create
        codigo_postal_found = CodigoPostal.find_by_cp(codigo_postal_params[:cp])
        return render json: codigo_postal_found if codigo_postal_found.present?

        begin
          codigo_postal = CodigoPostalService.new.create(codigo_postal_params)
        rescue StandardError
          return render status: :unprocessable_entity
        end

        render json: codigo_postal
      end

      private

      def codigo_postal_params
        params.permit(:cp, :street, :municipality, :state, :city, :country, :interior_number,
                      :outdoor_number, :suburb)
      end
    end
  end
end
