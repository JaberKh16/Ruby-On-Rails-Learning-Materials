class UserController < ApplicationController
    def signup
    end

    def index
        if params[:q].present?
            query = params[:q]
            @users = User.where("name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%")
            respond_to do |format|
                format.html
                format.json {
                    render json: { status: 'SUCCESS', message: 'Loaded all users', data: @users }, status: :ok
                }
            end

        # render :index
        else
            @users = User.all
            respond_to do |format|
                format.html
                format.json {
                    render json: { status: 'SUCCESS', message: 'Loaded all users', data: @users }, status: :ok
                }
            end
        end


           
        # to pass data in json format
        # @users = User.all
        # if @user.present?
        #     render json: {status: 'SUCCESS', message: 'Loaded all users', data: @user}, status: :ok
        # else
        #     render json: {status: 'ERROR', message: 'No users found'}, status: :not_found
        # end
    end

    def new
        @user = User.new
        render "create"  # render "create" view
    end

    def create
        @user = User.new(user_params)
        # return user_params   # to see the form passed params
        if @user.save
            redirect_to user_index_path, notice: "User successfully created."
        else
            flash.now[:alert] = "Error creating user."
            redirect_to user_index_path, status: :unprocessable_entity
        end
    end

    def show
        # find specific user by id
        @user = User.find(params[:id])
        if @user.present?
            render :show, notice: "User details loaded."
        else
            render :index, alert: "User not found."
        end
    end

    def edit
        @user = User.find(params[:id])
    end 

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_show_path(@user), notice: "User successfully updated."
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :confirm_pass, :is_active)
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to user_index_path, notice: "User successfully deleted."
        else
            redirect_to user_index_path, alert: "Error deleting user."
        end
    end


    # def search
    #     query = params[:query]
    #     @users = User.where("name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%")
    #     if @users.empty?
    #         flash.now[:alert] = "No users found matching '#{query}'."
    #     end
    #     render :index
    # end


end
