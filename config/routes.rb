Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :addresses, only: %i[index show create update destroy]
      get '/catalogs/postal_code', to: 'catalogs#postal_code'
      get '/catalogs/suburbs', to: 'catalogs#suburbs'
    end
  end
end
