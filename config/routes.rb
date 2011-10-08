Liveapp1::Application.routes.draw do

  #resources :users

  resources :votes

  resources :posts

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
   root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  # Routes to post controller
  match 'posts/increment_vote/:id', :to =>'posts#increment_vote'
  match 'posts/search',:to => 'posts#search'
  match 'posts/:id/delete',:to=>'posts#delete'

  match 'posts/:id/reply',:to=>'posts#reply'
  #match 'posts/:id/create_reply',:to=>'posts#create_reply'
  match 'posts/:id/display_all_replies',:to=>'posts#display_all_replies'


  # Routes to users controller
  resources :users ,:except => [:delete, :show, :edit, :update]
=begin
  match 'users/new', :to => 'users#new'
  match 'users/create', :to => 'users#create'
  match 'users/edit', :to => 'users#edit'
  match 'users/update', :to => 'users#update'
=end

  match 'users/login', :to => 'users#login'
  match 'users/:id/edit', :to => 'users#edit'
  match 'users/logout', :to => 'users#logout'
  match 'users/list', :to => 'users#list'
  match 'users/view_post_activity',:to => 'users#view_post_activity'
  match 'users/show_all_posts', :to => 'users#show_all_posts'
  match 'users/show_all_users', :to => 'users#show_all_users'
  match 'users/delete_user', :to => 'users#delete_user'
  match 'users/manage_users', :to => 'users#manage_users'
  match 'users/delete_user', :to => 'users#delete_user'
  match 'users/update', :to => 'users#update'

end
