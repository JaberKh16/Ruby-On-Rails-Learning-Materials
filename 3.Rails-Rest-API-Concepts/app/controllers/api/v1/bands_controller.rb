module Api
    module V1
        class BandsController < ApplicationController
            
            # GET /bands/index
            def index
                begin
                    bands = Band.all
                    # bands = Band.includes(:band_members) # can also include with model => # eager load band_members
                    # render json: bands, status: :ok # passing whole band object
                    # render json: band, status: :ok, only[:name, :established_year ] # passing specific columns

                    # render with association
                    render json: band.as_json(
                        include: :band_members,          # include associated band_members
                        only: [:name, :established_year] # only these columns from band
                    ), status: :ok
                rescue ActiveRecord::RecordNotFound => e
                    render json: { error: "No bands found: #{e.message}" }, status: :not_found

                rescue StandardError => e
                    # Catch any other unexpected errors
                    render json: { error: "Something went wrong: #{e.message}" }, status: :internal_server_error
                end
            end

            # GET /api/v1/bands/:id
            def show
                begin
                    band = Band.find(params[:id])  # Use params[:id] from the URL
                    render json: band, status: :ok 
            
                rescue ActiveRecord::RecordNotFound
                    render json: { error: "Band not found" }, status: :not_found

                rescue StandardError => e
                    # Catch any other unexpected errors
                    render json: { error: "Something went wrong: #{e.message}" }, status: :internal_server_error
                end
            end


            # POST /bands/create
            def create
                begin
                    band = Band.new(request_params)

                    if band.save
                        render json: band, status: :created
                    else
                        render json: { errors: band.errors.full_messages }, status: :unprocessable_entity
                    end
                rescue ActiveRecord::RecordInvalid => e
                    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
                rescue StandardError => e
                    # Log the unexpected error (in production, this should go to error tracking like Sentry/Rails logger)
                    Rails.logger.error "Unexpected error creating band: #{e.message}"
                    Rails.logger.error e.backtrace.join("\n")

                    render json: { errors: ["An unexpected error occurred. Please try again later."] }, status: :internal_server_error
                end
            end


            # proper validation message setp
            # def create
            #     band = Band.create!(request_params)
            #     render json: band, status: :created
            # rescue ActiveRecord::RecordNotUnique => e
            #     render json: { errors: ["Band name already exists"] }, status: :unprocessable_entity
            # rescue ActiveRecord::RecordInvalid => e
            #     render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
            # rescue StandardError => e
            #     Rails.logger.error "Unexpected error creating band: #{e.message}"
            #     render json: { errors: ["Something went wrong"] }, status: :internal_server_error
            # end

            private
            
            # =begin
            #     {
            #         "band": {
            #             "name": "The Beatles",
            #             "established_year": 1960
            #         }
            #     }

            # =end
            # def request_params
            #     params.require(:band).permit(
            #         :name,
            #         :established_year
            #     )
            # end


            def request_params
                params.permit(:name, :established_year)
            end



            # GET /bands/:id/edit
            def edit
                begin
                    band = Band.find(params[:id])
                    # rescue ActiveRecord::RecordNotFound
                    #     render json: { error: "Band not found" }, status: :not_found
                    if band.empty?
                        redner json: band, status: :ok
                    else
                        redner json: { errors: band.errors.full_messages }, status: :ok 
                    end 
                rescue ActiveRecord::RecordNotFound
                    render json: { error: "Band not found" }, status: :not_found
                rescue StandardError => e
                    # Log the unexpected error (in production, this should go to error tracking like Sentry/Rails logger)
                    Rails.logger.error "Unexpected error creating band: #{e.message}"
                    Rails.logger.error e.backtrace.join("\n")

                    render json: { errors: ["An unexpected error occurred. Please try again later."] }, status: :internal_server_error
                end
            end

            # POST /bands/:id/update
            def update
                begin
                    band = Band.find(request_params[:id])
                    if band.empty?
                        updated = band.update(request_params)
                        if updated == true 
                            render json: band, status: :ok
                        else 
                            redner json: { errors: band.errors.full_messages }, status: :unprocessable_entity
                        end
                    else
                        redner json: { errors: band.errors.full_messages }, status: :unprocessable_entity
                    end
                rescue ActiveRecord::RecordNotFound
                    render json: { error: "Band not found" }, status: :not_found
                rescue StandardError => e
                    # Log the unexpected error (in production, this should go to error tracking like Sentry/Rails logger)
                    Rails.logger.error "Unexpected error creating band: #{e.message}"
                    Rails.logger.error e.backtrace.join("\n")

                    render json: { errors: ["An unexpected error occurred. Please try again later."] }, status: :internal_server_error
                end
            end


            # POST /bands/:id/destroy
            def destroy
                begin
                    band = Band.find(request_params[:id])
                    if band.empty?
                        deleted = band.destroy
                        if deleted == true 
                            # head :no_content
                            render json: band, status: :ok
                        else 
                            redner json: { errors: band.errors.full_messages }, status: :unprocessable_entity
                        end
                    else
                        redner json: { errors: band.errors.full_messages }, status: :unprocessable_entity
                    end
                rescue ActiveRecord::RecordNotFound
                    render json: { error: "Band not found" }, status: :not_found
                rescue StandardError => e
                    # Log the unexpected error (in production, this should go to error tracking like Sentry/Rails logger)
                    Rails.logger.error "Unexpected error creating band: #{e.message}"
                    Rails.logger.error e.backtrace.join("\n")

                    render json: { errors: ["An unexpected error occurred. Please try again later."] }, status: :internal_server_error
                end
            end

        end
    end
end
