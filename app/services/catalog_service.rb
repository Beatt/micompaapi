# frozen_string_literal: true

# CatalogService
class CatalogService
  attr_reader :search_engine

  def initialize(search_engine)
    @search_engine = search_engine
  end
end
