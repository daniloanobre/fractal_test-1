module Api::V1
  class ProductsController < ApiController
    include ProductsHelper
    before_action :set_product, only: [:show, :update, :destroy, :supplier, :categories, :place]

    # swagger_controller :products, 'Products'

    # swagger_api :index do
    #   summary 'Fetches all products'
    #   notes "This lists all the products"
    #   param :query, :name, :string, :optional, "Product name"
    #   param :query, :category, :string, :optional, "Category name"
    # end

    # swagger_api :show do
    #   summary "Fetches a single Product item"
    #   param :path, :id, :integer, :optional, "Product Id"
    #   response :ok, "Success", :Product
    #   response :not_found
    # end

    # swagger_api :create do
    #   summary "Creates a new Product"
    #   param :form, :name, :string, :required, "Product name"
    #   param :form, :supplier_id, :string, :required, "Supplier Id"
    #   param :form, :place_id, :string, :required, "Place Id"
    #   param :form, :category_id, :array, :required, "Category Id"
    #   param_list :form, :role, :string, :required, "Role", [ "admin", "superadmin", "user" ]
    # end

    # swagger_api :update do
    #   summary "Updates an existing Product"
    #   param :path, :id, :integer, :required, "Product Id"
    #   param :form, :first_name, :string, :optional, "First name"
    #   param :form, :last_name, :string, :optional, "Last name"
    #   param :form, :email, :string, :optional, "Email address"
    #   param :form, :tag, :Tag, :required, "Tag object"
    #   response :not_found
    # end

    # swagger_api :destroy do
    #   summary "Deletes an existing Product item"
    #   param :path, :id, :integer, :optional, "Product Id"
    #   response :not_found
    # end

    # GET /products
    def index
      search = params[:name] || "*"
      conditions = {}
      conditions[:category] = params[:category] if params[:category].present?

      # with redis for perform_caching
      @products = fetch_products(search, conditions)
      
      # without redis for perform_caching
      # @products = Product.search search, fields: [:name], where: conditions

      render json: @products, status: :ok
    end

    # GET /products/1
    def show
      render json: @product
    end

    # GET /products/supplier
    def supplier
      render json: @product.supplier
    end

    # GET /products/categories
    def categories
      render json: @product.categories
    end

    # GET /products/place
    def place
      render json: @product.place
    end

    # POST /products
    def create
      @product = Product.new(product_params)
      @product.categories  = Category.where(id: params[:category_id])

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
