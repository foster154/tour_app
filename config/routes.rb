TourApp::Application.routes.draw do
  mount StripeEvent::Engine => '/stripe'
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users, :except => [:edit, :show]

  # devise_for :users
  # resources :users
  resources :tours, :except => [:index] do
    resources :photos, only: [:new, :create, :destroy] 
  end

  resources :photos do
    collection { post :sort }  # from railscasts #147... not sure if I need this
  end

  root :to => 'static_pages#home' 

 
  match '/signup',    to: 'users#new',            via: 'get'
  match '/signin',    to: 'sessions#new',         via: 'get'
  match '/signout',   to: 'sessions#destroy',     via: 'delete'
  match '/support',   to: 'static_pages#support', via: 'get'
  match '/about',     to: 'static_pages#about',   via: 'get'
  match 'tours/b/:id', to: 'tours#show_branded',  via: 'get' 

  # new
  match '/profile',   to: 'users#edit',           via: 'get'
  match '/dashboard', to: 'users#show',           via: 'get'
  match '/tours',     to: 'tours#index',          via: 'get'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
