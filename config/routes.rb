Rails.application.routes.draw do
  root "dashboard#index"
#Endpoints Api
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :expenses
    end
  end
#Vistas
  resources :expenses
end
