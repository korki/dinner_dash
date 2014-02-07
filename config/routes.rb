DinnerDash::Application.routes.draw do

  get 'categories/' => 'categories#index',                            as: :categories
  get 'categories/:id' => 'categories#show',                          as: :items_category
  get 'admin/categories/' => 'admin/categories#index',                as: :admin_categories
  get 'admin/categories/new' => 'admin/categories#new',               as: :new_category
  get 'admin/categories/:id'      => 'admin/categories#show',         as: :category
  get 'admin/categories/:id/edit' => 'admin/categories#edit' ,        as: :edit_category
  put 'admin/categories/:id'      => 'admin/categories#update'
  post 'categories' =>'admin/categories#create'
  delete 'admin/categories/:id/delete' => 'admin/categories#destroy', as: :delete_category


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
