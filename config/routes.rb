DinnerDash::Application.routes.draw do

  resources :orders
  resources :items
  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]
  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

  get 'admin' => 'orders#admin_index'
  get 'admin/orders' => 'orders#admin_index'
  get 'admin/order/:id/:status' => 'orders#admin_status_change', as: :status_change
  get 'admin/orders/:status' => 'orders#admin_status_filter', as: :status_filter

  root 'items#index'

end
