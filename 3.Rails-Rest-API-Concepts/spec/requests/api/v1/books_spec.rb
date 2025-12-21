require 'rails_helper'


RSpec.describe "Books API", type: :request do
  let!(:book) do
    Book.create!(
      title: 'Rails API',
      isbn: 'rails-123',
      author: 'DHH',
      price: 50.25,
      description: 'Book about Rails API concepts',
      published_year: 2024
    )
  end

  let(:valid_attributes) do
    {
      book: {
        title: 'C Programming',
        isbn: 'c-123',
        author: 'Dennis Ritchie',
        price: 300.21,
        description: 'This is a book about C Programming',
        published_year: 1992
      }
    }
  end

  let(:invalid_attributes) do
    {
      book: {
        title: '',
        price: -10
      }
    }
  end

  # GET /books
  describe "GET /books" do
    it "returns all books" do
      get '/books'

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to be >= 1
    end
  end

  # GET /books/:id
  describe "GET /books/:id" do
    it "returns a single book" do
      get "/books/#{book.id}"

      json = JSON.parse(response.body)

      expect(response).to have_http_status(:ok)
      expect(json['title']).to eq('Rails API')
    end
  end

  # POST /books
  describe "POST /books" do
    context "with valid data" do
      it "creates a book" do
        expect {
          post '/books', params: valid_attributes
        }.to change(Book, :count).by(1)

        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid data" do
      it "returns validation errors" do
        post '/books', params: invalid_attributes

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end

  # PATCH /books/:id
  describe "PATCH /books/:id" do
    it "updates a book" do
      patch "/books/#{book.id}", params: {
        book: { price: 99.99 }
      }

      expect(response).to have_http_status(:ok)
      expect(book.reload.price).to eq(99.99)
    end
  end

  # DELETE /books/:id
  describe "DELETE /books/:id" do
    it "deletes a book" do
      expect {
        delete "/books/#{book.id}"
      }.to change(Book, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
