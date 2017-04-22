module Api::V1
  class ApiController < ApplicationController
    include Swagger::Docs::ImpotentMethods
  end
end