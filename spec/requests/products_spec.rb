require 'rails_helper'

RSpec.describe "Products", type: :request do

  let(:valid_product_attrs) {
    attributes_for(:product)
  }

  describe "GET /products" do
    # before { post v1_products_path valid_product_attrs }

    it "should be returns a products list" do
      get v1_products_path
      expect(response).to have_http_status(200)
    end

    # it "should be returns a products list join supplier, place and categories" do
    #   get v1_products_path
    #   json = JSON.parse(response.body)
    #   raise response.body
    #   expect(json['data']['suplier']).to be_present
    #   expect(json['data']['place']).to be_present
    #   expect(json['data']['categories']).to be_present
    #   expect(response).to have_http_status(200)
    # end
  end

  # describe "POST /products" do
  #   it "should be returns a product created" do
  #     post v1_products_path, params: valid_product_attrs
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
