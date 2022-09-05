# frozen_string_literal: true

# CodigoPostalService
class AddressService
  def index
    Address.all
  end

  def create(data)
    address = Address.new(data)
    address.save

    address
  end

  def update(id, data)
    address = Address.find(id)
    address.update(data)

    address
  end

  def delete(id)
    Address.delete(id)
  end
end
