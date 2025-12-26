class Api::V1::UserController < ApplicationController
  # authenticated user only
  before_action :authenticate_user! 
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    if @users.present?
      render json: @users, status: :ok
    else
      render json: { message: 'No users found' }, status: :not_found
    end
  end

  def get_authenticated_user
    if user_signed_in?
      @authenticated_user = current_user
      @user_info = User.find_by(email: @authenticated_user.email)
      
      if @user_info && @user_info.email == @authenticated_user.email
        render json: {
          message: 'Authenticated',
          status: :ok,
          data: @user_info
        }, status: :ok
      else
        render json: {
          message: 'Unauthorized Action',
          status: 403
        }, status: :forbidden
      end
    else
      render json: {
        message: 'User not signed In',
        status: :unprocessable_entity
      }, status: :unprocessable_entity
    end
  end

  def check_whether_the_token_exists_for_the_user
    # Implementation depends on your authentication setup
    if current_user&.token.present?
      render json: { token_exists: true }, status: :ok
    else
      render json: { token_exists: false }, status: :ok
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        message: 'User has been created',
        status: :created,
        data: @user
      }, status: :created
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity    
    end
  end

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: {
        message: 'User updated successfully',
        status: :ok,
        data: @user
      }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { message: 'User was successfully deleted.', status: :ok }, status: :ok
    else
      render json: { message: 'Something went wrong', errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :nid, :is_active_status, :email, :password, :password_confirmation)
  end
end