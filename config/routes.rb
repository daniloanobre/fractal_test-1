Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/docs', to: redirect('/vendors/swagger-ui/dist/index.html?url=/api/v1/api-docs.json')
  
  scope module: 'api' do
    namespace :v1 do
      resources :products
      get 'products/:id/supplier', to: 'products#supplier'
      get 'products/:id/categories', to: 'products#categories'
      get 'products/:id/place', to: 'products#place'
    end
  end

end
