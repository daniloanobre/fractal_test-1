module Api::V1
  class ProductsController < ApiController
    include ProductsHelper
    before_action :set_product, only: [:show, :update, :destroy, :supplier, :categories, :place]

    # GET /products
    def index
      search = params[:name] || "*"
      conditions = {}
      conditions[:category] = params[:category] if params[:category].present?

      # with redis for perform_caching
      @products = fetch_products(search, conditions)
      
      # without redis for perform_caching
      # @products = Product.search search, fields: [:name], where: conditions

      render json: @products
    end

    # GET /products/1
    def show
      # render json: @product
      render json: ProductSerializer.new(@product)
    end

    # GET /products/supplier
    def supplier
      render json: SupplierSerializer.new(@product.supplier)
    end

    # GET /products/categories
    def categories
      render json: ActiveModel::Serializer::CollectionSerializer.new(@product.categories, 
        each_serializer: CategorySerializer)
    end

    # GET /products/place
    def place
      render json: PlaceSerializer.new(@product.place)
    end

    # POST /products
    def create
      @product = Product.new(product_params)
      @product.categories = Category.where(id: params[:category_id])

      if @product.save
        # The deliver_later uses ActiveJob too, but i chose create another job for this
        # SupplierMailer.registered_product(@product).deliver_later
        
        # So calling SendEmailToSupplierJob asyncronously with perform_later
        SendEmailToSupplierJob.perform_later @product
        
        render json: @product, status: :created
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    def update
      @product.categories = Category.where(id: params[:category_id])

      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    def destroy
      @product.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :supplier_id, :place_id, category_id: [])
      end
  end
end
