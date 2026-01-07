class HomeController < ApplicationController
    def index 
    end

    def about
        # render a json
        render json:{
            message: 'About',
            status: :ok
        }
    end
end