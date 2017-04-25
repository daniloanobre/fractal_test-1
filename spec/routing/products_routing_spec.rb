require "rails_helper"

RSpec.describe Api::V1::ProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/v1/products").to route_to("api/v1/products#index")
    end

    it "routes to #show" do
      expect(:get => "/v1/products/1").to route_to("api/v1/products#show", :id => "1")
    end

    it "routes to #supplier" do
      expect(:get => "/v1/products/1/supplier").to route_to("api/v1/products#supplier", :id => "1")
    end

    it "routes to #place" do
      expect(:get => "/v1/products/1/place").to route_to("api/v1/products#place", :id => "1")
    end

    it "routes to #categories" do
      expect(:get => "/v1/products/1/categories").to route_to("api/v1/products#categories", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/v1/products").to route_to("api/v1/products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/v1/products/1").to route_to("api/v1/products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/v1/products/1").to route_to("api/v1/products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/v1/products/1").to route_to("api/v1/products#destroy", :id => "1")
    end
  end
end
