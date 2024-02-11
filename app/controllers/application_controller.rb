class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do
    render json: { message: "Cliente não encontrado" }, status: :not_found
  end
end
