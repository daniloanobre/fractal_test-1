module ProductsHelper
  def fetch_products(search, conditions)
    products_json = $redis.get("products")
    if products_json.nil?
      products = Product.search search, fields: [:name], where: conditions
      products_json = ActiveModel::Serializer::CollectionSerializer.new(products, 
        each_serializer: ProductSerializer).to_json
      $redis.set("products", products_json)
      # Expire the cache, every 5 hours
      $redis.expire("products", 5.hour.to_i)
    end
    JSON.parse(products_json)
  end
end
