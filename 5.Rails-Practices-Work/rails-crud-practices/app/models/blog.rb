class Blog < ApplicationRecord
  belongs_to :user

  def index 
    @post = Post.all
    if @post.valid?
      render json: {
        'message': 'Posts been found.',
        'status': :created,
        'data': @post
      } , status: :ok
    else
      render json: {
        'message': 'Post rendering failed.',
        'status': :created,
        'errors': @post.errors.full_message
      } , status: :unprocessable_entity
    end    
  end



  def show
  end

  def create
  end


  def update
  end


  def destroy
  end
end
