require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::ProductsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Product. As you add validations to Product, be sure to
  # adjust the attributes here as well.
  let(:valid_supplier) { create(:supplier) }
  let(:valid_place) { create(:place) }
  let(:valid_categories) { create_list(:category, 3) }
  let(:valid_attributes) {
    attributes_for(:product, supplier_id: valid_supplier.id, place_id: valid_place.id, 
      category_ids: valid_categories.map(&:id))
  }
  let(:invalid_attributes) {
    attributes_for(:product, name: nil)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all products as @products" do
      product = Product.create! valid_attributes
      Product.reindex
      get :index, params: {}, session: valid_session
      product = JSON.parse(ProductSerializer.new(product).to_json)
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}, session: valid_session
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}, session: valid_session
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, params: {product: valid_attributes}, session: valid_session
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        post :create, params: {product: invalid_attributes}, session: valid_session
        expect(assigns(:product)).to be_a_new(Product)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:product, supplier_id: valid_supplier.id, place_id: valid_place.id, 
          category_ids: valid_categories.map(&:id))
      }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: new_attributes}, session: valid_session
        product.reload
      end

      it "assigns the requested product as @product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session
        expect(assigns(:product)).to eq(product)
      end
    end

    context "with invalid params" do
      it "assigns the product as @product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session
        expect(assigns(:product)).to eq(product)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: {id: product.to_param}, session: valid_session
      }.to change(Product, :count).by(-1)
    end
  end

end
