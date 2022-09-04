# frozen_string_literal: true

require 'test_helper'

class CodigoPostalServiceTest < ActiveSupport::TestCase
  setup do
    CodigoPostal.delete_all
  end

  test 'create código postal' do
    params = {
      cp: '14030',
      street: '3a poniente 19',
      municipality: 'Tlalpan',
      state: 'Ciudad de México',
      city: nil,
      country: 'México',
      interior_number: nil,
      outdoor_number: '7',
      suburb: 'Isidro fabela'
    }
    CodigoPostalService.new.create(params)

    codigo_postal_found = CodigoPostal.last

    assert_equal 1, CodigoPostal.all.size
    assert_equal '14030', codigo_postal_found.cp
    assert_equal '3a poniente 19', codigo_postal_found.street
    assert_equal 'Tlalpan', codigo_postal_found.municipality
    assert_equal 'Ciudad de México', codigo_postal_found.state
    assert_equal 'México', codigo_postal_found.country
    assert_equal '7', codigo_postal_found.outdoor_number
    assert_equal 'Isidro fabela', codigo_postal_found.suburb
    assert_nil codigo_postal_found.city
    assert_nil codigo_postal_found.interior_number
  end
end
