module Api
    module V1 
        class ArchiveController  < ApplicationController
            
            def index
            end
        

            def create
            end

            private
            def archive_params
                params.require(:archive).permit(

                )
            end

            def show
            end

            def edit
            end

            def update
            end

            def destroy
            end


        end
    end
end