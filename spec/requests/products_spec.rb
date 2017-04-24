require 'rails_helper'

RSpec.describe "Products", type: :request do

  def check_presence_of_product_associations
    json = JSON.parse(response.body)
    expect(json).to have_key("supplier")
    expect(json).to have_key("place")
    expect(json).to have_key("categories")
  end

  def check_presence_of_product_categories_association
    category_attrs = CategorySerializer.new(valid_categories.first).attributes
    expect(JSON.parse(response.body)["categories"]).to include(category_attrs.as_json)
  end

  def check_presence_of_product_supplier_association
    supplier_attrs = SupplierSerializer.new(valid_supplier).attributes
    expect(JSON.parse(response.body)["supplier"]).to include(supplier_attrs.as_json)
  end

  def check_presence_of_product_place_association
    place_attrs = PlaceSerializer.new(valid_place).attributes
    expect(JSON.parse(response.body)["place"]).to include(place_attrs.as_json)
  end

  let(:valid_supplier) { create(:supplier) }
  let(:valid_place) { create(:place) }
  let(:valid_categories) { create_list(:category, 3) }
  let(:valid_product_attrs) {
    return {
      category_id: valid_categories.map(&:id),
      product: {
        name: Faker::Name.name, 
        supplier_id: valid_supplier.id,
        place_id: valid_place.id
      }
    }
  }

  describe "/products" do
    context "GET" do
      before { create_list(:product, 10) }

      it "should be returns a products list" do
        get "/v1/products"
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(200)
      end

      it "should be returns a products list join supplier, place and categories" do
        get "/v1/products"
        json = JSON.parse(response.body)
        expect(json.last).to have_key("supplier")
        expect(json.last).to have_key("place")
        expect(json.last).to have_key("categories")
      end
    end

    context "POST" do
      it "should be returns a product created" do
        post "/v1/products", params: valid_product_attrs
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(201)
      end

      it "should be returns a products list join supplier, place and categories" do
        post "/v1/products", params: valid_product_attrs
        check_presence_of_product_associations
      end
    end
  end

  describe "/products/id" do
    before { post "/v1/products", params: valid_product_attrs }

    context "GET" do
      it "should be returns a product" do
        get "/v1/products/#{JSON.parse(response.body)["id"]}"
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(200)
      end

      it "should be returns a product join supplier, place and categories" do
        check_presence_of_product_associations
      end
      
      context "associations" do
        it "should be returns a categories list from product" do
          check_presence_of_product_categories_association
        end

        it "should be returns a supplier from product" do
          check_presence_of_product_supplier_association
        end

        it "should be returns a place from product" do
          check_presence_of_product_place_association
        end
      end

      context "/supplier" do
        it "should be returns the supplier from product" do
          get "/v1/products/#{JSON.parse(response.body)["id"]}/supplier"
          expect(response.content_type).to eq("application/json")
          expect(response).to have_http_status(200)
        end

        it "should be returns the supplier association from product" do
          get "/v1/products/#{JSON.parse(response.body)["id"]}/supplier"
          supplier_attrs = SupplierSerializer.new(valid_supplier).attributes
          expect(JSON.parse(response.body)).to include(supplier_attrs.as_json)
        end
      end

      context "/place" do
        it "should be returns the place from product" do
          get "/v1/products/#{JSON.parse(response.body)["id"]}/place"
          expect(response.content_type).to eq("application/json")
          expect(response).to have_http_status(200)
        end

        it "should be returns the place association from product" do
          get "/v1/products/#{JSON.parse(response.body)["id"]}/place"
          place_attrs = PlaceSerializer.new(valid_place).attributes
          expect(JSON.parse(response.body)).to include(place_attrs.as_json)
        end
      end

      context "/categories" do
        it "should be returns the categories from product" do
          get "/v1/products/#{JSON.parse(response.body)["id"]}/categories"
          expect(response.content_type).to eq("application/json")
          expect(response).to have_http_status(200)
        end

        it "should be returns the categories association from product" do
          get "/v1/products/#{JSON.parse(response.body)["id"]}/categories"
          category_attrs = ActiveModel::Serializer::CollectionSerializer.new(valid_categories, 
            each_serializer: CategorySerializer).first.attributes
          expect(JSON.parse(response.body)).to include(category_attrs.as_json)
        end
      end
    end

    context "PUT" do
      it "should be returns a product updated" do
        put "/v1/products/#{JSON.parse(response.body)["id"]}", params: valid_product_attrs
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(200)
      end

      it "should be returns a product join supplier, place and categories" do
        check_presence_of_product_associations
      end
      
      context "associations" do
        it "should be returns a categories list from product" do
          check_presence_of_product_categories_association
        end

        it "should be returns a supplier from product" do
          check_presence_of_product_supplier_association
        end

        it "should be returns a place from product" do
          check_presence_of_product_place_association
        end
      end
    end

    context "PATCH" do
      it "should be returns a product updated" do
        patch "/v1/products/#{JSON.parse(response.body)["id"]}", params: valid_product_attrs
        expect(response.content_type).to eq("application/json")
        expect(response).to have_http_status(200)
      end

      it "should be returns a product join supplier, place and categories" do
        check_presence_of_product_associations
      end
      
      context "associations" do
        it "should be returns a categories list from product" do
          check_presence_of_product_categories_association
        end

        it "should be returns a supplier from product" do
          check_presence_of_product_supplier_association
        end

        it "should be returns a place from product" do
          check_presence_of_product_place_association
        end
      end
    end

    describe "DELETE" do
      it "should destroy a product" do
        delete "/v1/products/#{JSON.parse(response.body)["id"]}"
        expect(response.body).to be_empty
        expect(response).to have_http_status(204)
      end
    end

  end
end
