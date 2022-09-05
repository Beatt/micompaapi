# frozen_string_literal: true

module Api
  module V1
    # AddressesController
    class AddressesController < ApplicationController
      def index
        addresses = AddressService.new.index
        response_ok(addresses)
      end

      def show
        begin
          address = Address.find(params[:id])
        rescue StandardError
          return address_not_found_error
        end

        response_ok(address)
      end

      def create
        address_found = Address.find_by_cp(address_params[:cp])
        if address_found.present?
          return conflict_error("¡El código postal #{address_params[:cp]} ya existe!"), status: :conflict
        end

        begin
          address = AddressService.new.create(address_params)
        rescue StandardError
          return unprocessable_entity_error('¡Hubo un problema al guardar la dirección!')
        end

        response_ok(address)
      end

      def destroy
        id = params[:id]

        begin
          Address.find(params[:id])
        rescue StandardError
          return address_not_found_error
        end

        AddressService.new.delete(id)

        response_not_content
      end

      def update
        id = params[:id]

        begin
          Address.find(id)
        rescue StandardError
          return address_not_found_error
        end

        address = AddressService.new.update(id, address_params)

        response_ok(address)
      end

      private

      def address_params
        params.permit(:cp, :street, :municipality, :state, :city, :country, :interior_number,
                      :outdoor_number, :suburb)
      end

      def address_not_found_error
        unprocessable_entity_error("¡La dirección con id #{params[:id]} no se encuentra!")
      end
    end
  end
end
