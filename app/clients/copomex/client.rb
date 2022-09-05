# frozen_string_literal: true

module Copomex
  # CopomexApi
  class Client
    include SearchEngines

    def initialize(http_client)
      @http_client = http_client
    end

    def find_postal_code(postal_code)
      url = "#{copomex_url}/info_cp/#{postal_code}?type=simplified&token=#{copomex_token}"
      response = @http_client.get(url)

      data = ActiveSupport::JSON.decode(response.body)

      create_response_postal_code(data['response'])
    end

    def find_suburbs_by_postal_code(postal_code)
      url = "#{copomex_url}/get_colonia_por_cp/#{postal_code}?token=#{copomex_token}"
      response = @http_client.get(url)

      data = ActiveSupport::JSON.decode(response.body)

      create_response_suburbs(data['response'])
    end

    private

    def create_response_postal_code(data)
      response = ResponsePostalCode.new
      response.city = data['ciudad']
      response.country = data['pais']
      response.municipality = data['municipio']
      response.state = data['estado']
      response
    end

    def create_response_suburbs(data)
      response = []
      data['colonia'].each do |item|
        response_suburb = ResponseSuburb.new
        response_suburb.name = item
        response.append response_suburb
      end

      response
    end

    def copomex_token
      ENV.fetch('COPOMEX_TOKEN', nil)
    end

    def copomex_url
      ENV.fetch('COPOMEX_URL', nil)
    end
  end
end
