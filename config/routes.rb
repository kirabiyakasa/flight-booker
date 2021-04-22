Rails.application.routes.draw do
  resources :flights, only: [:index] do
    get :search, on: :collection
  end
  resources :bookings, only: [:new, :create, :show]

  root 'flights#index'
end
