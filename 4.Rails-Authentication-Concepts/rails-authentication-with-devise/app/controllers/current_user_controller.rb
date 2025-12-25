class CurrentUserController < ApplicationController
  # adding below action will ensure that we see a 200 response if we have a valid JWT in the headers, otherwise if dont then 401
  before_action :authenticate_user!
  def index
    render json: UserSerialzier.new(current_user).serializeable_hash[:data][:attributes], status: :ok
  end
end