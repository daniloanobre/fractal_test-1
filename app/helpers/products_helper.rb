# frozen_string_literal: true

module ProductsHelper
  def fetch_products(search, conditions)
    category = conditions[:category] unless conditions[:category].nil?
    redis_key = "products:#{search || 0}:#{category || 0}"
    products_json = $redis.get(redis_key)
    if products_json.nil?
      search = search || "*"
      products = Product.search search, fields: [:name], where: conditions
      products_json = ActiveModel::Serializer::CollectionSerializer.new(products,
        each_serializer: ProductSerializer).to_json
      $redis.set(redis_key, products_json)
      # Expire the cache, every 5 hours
      $redis.expire(redis_key, 5.hour.to_i)
    end
    JSON.parse(products_json)
  end
end
