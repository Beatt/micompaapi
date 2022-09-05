# frozen_string_literal: true

# CopomexApi
class CopomexApi
  include SearchEngines

  TOKEN = ENV.fetch('COPOMEX_TOKEN', nil)
  URL = ENV.fetch('COPOMEX_URL', nil)

  def initialize(http_client)
    @http_client = http_client
  end

  def find_postal_code(postal_code)
    url = "#{URL}/info_cp/#{postal_code}?type=simplified&token=#{TOKEN}"
    response = @http_client.get(url)

    data = ActiveSupport::JSON.decode(response.body)

    create_response_postal_code(data['response'])
  end

  def find_suburbs_by_postal_code(postal_code)
    url = "#{URL}/get_colonia_por_cp/#{postal_code}?token=#{TOKEN}"
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
    data['response']['colonia'].each do |item|
      response_suburb = ResponseSuburb.new
      response_suburb.name = item
      response.append response_suburb
    end

    response
  end
end
