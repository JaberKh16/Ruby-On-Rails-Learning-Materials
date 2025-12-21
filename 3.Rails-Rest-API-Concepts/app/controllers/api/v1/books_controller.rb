
module Api
    module V1
        class BooksController < ApplicationController
            # to setup what actions can be perform
            # before_action :set_book, only: [:show, :edit, :update, :destroy]
            
            def index
                books = Book.all
                render json: books, status:200
            end

            def create 
                # static data
                # book = Book.new(
                #     title: 'C Programming', 
                #     isbn: 'c-program#1214', 
                #     author: 'Dennie Ritch', 
                #     price: 300.21, 
                #     description: 'This is a book about C Programming', 
                #     published_year: 1992
                # )

                # pass via request
                book = Book.new(book_params)
                if book.save == true 
                    render json: book, status: :created # :created => 201 
                else 
                    render json: { errors: book.errors.full_messages }, status: :uprocessable_entity # :uprocessable_entity => 422 
                end 
            end

            private
            def book_params
                params.require(:book).permit(
                    :title,
                    :isbn,
                    :author,
                    :price,
                    :description,
                    :published_year
                )
            end


            # GET /books/:id
            def show
                render json: @book, status: :ok
            end


            # GET /books/:id/edit
            # (Usually not needed in APIs, but included for completeness)
            def edit
                render json: @book, status: :ok
            end

            # PATCH/PUT /books/:id
            def update
                if @book.update(book_params)
                    render json: @book, status: :ok
                else
                    render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
                end
            end

            # DELETE /books/:id
            def destroy
                book_deleted = @book.destroy
                if book_deleted == true  
                    head :no_content
                else 
                    render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
                end
            end

            private

            # initializer set which find the specified :id book info
            def set_book
                @book = Book.find(params[:id])
            end
        end
    end
end