json.extract! product, :id, :id, :name, :sku, :price, :description, :image, :created_at, :updated_at
json.url product_url(product, format: :json)
