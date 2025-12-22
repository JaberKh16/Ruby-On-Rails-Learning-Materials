class ApplicationController < ActionController::API
    # before_action :authenticate_user!
    # skip_before_action :authenticate_user!, only: [:index, :create, :show, :edit, :update, :destroy]

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from StandardError, with: :render_internal_error  # Optional: catch unexpected errors
    before_action :set_default_format

    private

    def set_default_format
        request.format = :json if request.path.start_with?('/api/v1')
    end

   
    private
    def render_not_found(exception)
        render json: { error: "Band not found" }, status: :not_found
    end

    def render_internal_error(exception)
        # Log the error in production: Rails.logger.error(exception)
        render json: { error: "Something went wrong: #{exception.message}" }, status: :internal_server_error
    end
end
