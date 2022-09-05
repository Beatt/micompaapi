# frozen_string_literal: true

# SearchEngines
module SearchEngines
  class ResponsePostalCode
    attr_accessor :country, :state, :city, :municipality
  end

  class ResponseSuburb
    attr_accessor :name
  end

  def find_postal_code(_postal_code)
    raise 'not implementation'
  end

  def find_suburbs_by_postal_code(_postal_code)
    raise 'not implementation'
  end
end
