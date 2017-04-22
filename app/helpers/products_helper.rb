module ProductsHelper
  def fetch_products(search, conditions)
    products = $redis.get("products")
    if products.nil?
      products = Product.search(search, fields: [:name], where: conditions).to_json
      $redis.set("products", products)
      # Expire the cache, every 5 hours
      $redis.expire("products", 5.hour.to_i)
    end
    JSON.load products
  end
end
