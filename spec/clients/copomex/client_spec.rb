# frozen_string_literal: true

require 'rails_helper'

describe 'Clients::Copomex::Client' do
  it 'find postal code' do
    response = instance_double('Faraday::Response', body: '{
          "error": false,
          "code_error": 0,
          "error_message": null,
          "response": {
              "cp": "09810",
              "asentamiento": [
                  "Minerva",
                  "Granjas Esmeralda",
                  "Los Cipreses",
                  "Progreso del Sur"
              ],
              "tipo_asentamiento": "Colonia",
              "municipio": "Iztapalapa",
              "estado": "Ciudad de México",
              "ciudad": "Ciudad de México",
              "pais": "México"
          }
      }')
    cp = '14030'
    faraday = class_double('Faraday', get: response)
    res = Copomex::Client.new(faraday).find_postal_code(cp)

    expect(res.country).to eq('México')
    expect(res.city).to eq('Ciudad de México')
    expect(res.state).to eq('Ciudad de México')
    expect(res.municipality).to eq('Iztapalapa')
  end

  it 'find suburbs by postal code' do
    response = instance_double('Faraday::Response', body: '{
          "error": false,
          "code_error": 0,
          "error_message": null,
          "response": {
              "colonia": [
                  "Minerva",
                  "Granjas Esmeralda"
              ]
          }
      }')
    cp = '14030'
    faraday = class_double('Faraday', get: response)
    res = Copomex::Client.new(faraday).find_suburbs_by_postal_code(cp)

    expect(res.size).to eq(2)
    expect(res[0].name).to eq('Minerva')
    expect(res[1].name).to eq('Granjas Esmeralda')
  end
end
