class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])

        devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
    end


    # exception class setup 
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActionController::ParameterMissing, with: :parameter_missing
    rescue_from CanCan::AccessDenied, with: :access_denied if defined?(CanCan)

    private

    def record_not_found(exception)
        render json: { error: exception.message }, status: :not_found
    end

    def record_invalid(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def parameter_missing(exception)
        render json: { error: exception.message }, status: :bad_request
    end

    def access_denied(exception)
        render json: { error: exception.message }, status: :forbidden
    end
end
