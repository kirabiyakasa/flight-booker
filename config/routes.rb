Rails.application.routes.draw do
  resources :flights, only: [:index, :show] do
    get :search, on: :collection
  end

  root 'flights#index'
end
