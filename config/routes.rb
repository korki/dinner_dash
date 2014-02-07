DinnerDash::Application.routes.draw do

 

  get 'categories/' => 'categories#index',                            as: :categories
  get 'categories/:id' => 'categories#show',                          as: :items_category
  get 'admin/categories/' => 'admin/categories#index',                as: :admin_categories
  get 'admin/categories/new' => 'admin/categories#new',               as: :new_category
  get 'admin/categories/:id'      => 'admin/categories#show',         as: :category
  get 'admin/categories/:id/edit' => 'admin/categories#edit' ,        as: :edit_category
  put 'admin/categories/:id'      => 'admin/categories#update'
  post 'admin/categories' =>'admin/categories#create'
  delete 'admin/categories/:id/delete' => 'admin/categories#destroy', as: :delete_category




  resources :users
  resources :user_sessions, only: [ :new, :create, :destroy ]
  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'examples#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
