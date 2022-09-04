# frozen_string_literal: true

# Handle códigos postales
class CodigoPostalService
  def create(data)
    codigo_postal = CodigoPostal.new(data)
    codigo_postal.save

    codigo_postal
  end
end
