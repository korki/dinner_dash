DinnerDash::Application.routes.draw do

  get 'categories/'                    => 'categories#index',        as: :categories
  get 'categories/:id'                 => 'categories#show',         as: :items_category
  post 'categories'                    => 'admin/categories#create'

  get 'admin/categories/'              => 'admin/categories#index',  as: :admin_categories
  get 'admin/categories/new'           => 'admin/categories#new',    as: :new_category
  get 'admin/categories/:id'           => 'admin/categories#show',   as: :category
  get 'admin/categories/:id/edit'      => 'admin/categories#edit' ,  as: :edit_category
  put 'admin/categories/:id'           => 'admin/categories#update'
  delete 'admin/categories/:id/delete' => 'admin/categories#destroy', as: :delete_category

  get 'cart/' => 'carts#show' , as: :cart
  post 'cart/item/add/:item_id' => 'carts#add', as: :add_item_cart
  post 'cart/item/remove/:item_id' => 'carts#remove', as: :remove_item_cart
  post 'cart/checkout/' => 'carts#checkout', as: :checkout

  resources :orders, only: [:index, :show]

  resources :items

  get 'admin/items' => 'items#admin_index'
  get 'admin' => 'admin/orders#index'
  get 'admin/orders' => 'admin/orders#index',   as: :admin_orders
  get 'admin/order/:id' => 'admin/orders#show', as: :admin_order
  post 'admin/order/:id' => 'admin/orders#update', as: :admin_order_edit

  get 'admin/order/:id' => 'order#admin_remove_item', as: :remove_item

  get 'admin/order/:id/:status' => 'admin/orders#status_change', as: :status_change
  get 'admin/orders/:status' => 'admin/orders#status_filter', as: :status_filter


  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]
  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

  root 'items#index'

end
