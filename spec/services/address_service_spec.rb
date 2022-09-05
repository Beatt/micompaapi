# frozen_string_literal: true

require 'rails_helper'

describe 'AddressService' do
  before do
    Address.delete_all
  end

  it 'create address' do
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
    AddressService.new.create(params)

    address_found = Address.last

    expect(Address.all.size).to eq(1)
    expect(address_found.cp).to eq('14030')
    expect(address_found.street).to eq('3a poniente 19')
    expect(address_found.municipality).to eq('Tlalpan')
    expect(address_found.state).to eq('Ciudad de México')
    expect(address_found.country).to eq('México')
    expect(address_found.outdoor_number).to eq('7')
    expect(address_found.suburb).to eq('Isidro fabela')
    expect(address_found.city).nil?
    expect(address_found.interior_number).nil?
  end
end
