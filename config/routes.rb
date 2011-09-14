ChatterConnectSandbox::Application.routes.draw do
  get "user/index"

  #Home
  get "home/index"

  #OAUTH2 Session Management
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'

  #ChatterAdapter
  get "social/index"
  match '/social' => 'social#index'
  match '/social/raw_feed_me' => 'social_raw#raw_feed_me'
  match '/social/raw_follows' => 'social_raw#raw_follows'
  match '/social/accounts' => 'social_raw#get_accounts', :as => :accounts
  match '/social/raw_feed_record/:recordId' => 'social_raw#raw_feed_record'
  match '/social/raw_feed_record' => 'social_raw#raw_feed_record'
  match '/social/raw_feed_item/:recordId' => 'social_raw#raw_feed_item'
  match '/social/raw_feed_item' => 'social_raw#raw_feed_item'
  match '/social/feed_me' => 'social#feed_me'
  match '/social/raw_users_me' => 'social_raw#raw_users_me'
  match '/social/update_status' =>'social#update_status'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
