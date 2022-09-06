# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::API
  def conflict_error(message)
    render json: { message: }, status: :conflict
  end

  def unprocessable_entity_error(message)
    render json: { message: }, status: :unprocessable_entity
  end

  def response_ok(data)
    render json: data, status: :ok
  end

  def response_not_content
    render status: :no_content
  end
end
