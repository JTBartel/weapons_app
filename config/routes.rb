 # We added boolean attributes to weapons for weapons approval, so that any weapons submitted default to "NOT" approved and won't show up on the web site until I apprave it.  I am the only one who is Admin User and only Admin User will see the boolean attribute field that changes the approval...
# Now, as for routes...there is NO NEED for weapons routing to belong to a user.  Any user will be able to go to whatever weapon pages we allow.  
WeaponsApp::Application.routes.draw do

  resources :users
  resources :microposts, only: [:create, :destroy]
  
  resources :weapons do 
    resources :gunpics
  end

  
  resources :sessions, :only => [:new, :create, :destroy] 
  match '/signup'       ,         :to => 'users#new'
  match '/signin'       ,         :to => 'sessions#new'
  match '/signout'      ,         :to => 'sessions#destroy'
  match '/help'         ,         :to => 'pages#help'
  match '/about'        ,         :to => 'pages#about'
  match '/advertising'  ,         :to => 'pages#advertising'
  match '/contact'      ,         :to => 'pages#contact'
  match '/privacy'      ,         :to => 'pages#privacy'
  match '/test'         ,         :to => 'pages#test'
  match '/testindex'    ,         :to => 'pages#testindex'  
  match '/testimonies'  ,         :to => 'pages#testimonies'
                  root :to => 'pages#home'
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
