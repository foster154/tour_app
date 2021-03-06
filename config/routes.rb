TourApp::Application.routes.draw do
  resources :agents

  mount StripeEvent::Engine => '/stripe'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  devise_scope :user do
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users, :except => [:edit, :show]

  # devise_for :users
  # resources :users
  resources :tours, :except => [:index] do
    resources :photos, only: [:new, :create, :destroy] 
  end

  match '/tours/:id/delete_photos', to: 'tours#delete_photos', via: 'get'

  resources :photos do
    collection { post :sort }  # from railscasts #147... not sure if I need this
  end

  resources :leads, only: [:create, :index]

  resources :charges

  root :to => 'static_pages#home' 

  # Sales Pages
  match '/home',      to: 'static_pages#home' ,     via: 'get'
  match '/features',  to: 'static_pages#features',  via: 'get'
  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/contact',   to: 'static_pages#contact',     via: 'get'
  match '/survey',    to: 'static_pages#survey',    via: 'get'
  match '/signup',    to: 'users#new',              via: 'get'
  match '/sample1',   to: 'tours#sample_tour1',     via: 'get'
  match '/sample2',   to: 'tours#sample_tour2',     via: 'get'

  # Blog
  namespace :blog do
    resources :articles, path: '', only: [:index, :show]
  end

  # App
  match '/signin',    to: 'sessions#new',         via: 'get'
  match '/signout',   to: 'sessions#destroy',     via: 'delete'
  match '/dashboard', to: 'users#show',           via: 'get'
  match '/profile',   to: 'users#edit',           via: 'get'
  match '/tours',     to: 'tours#index',          via: 'get'

  match 'tours/b/:id', to: 'tours#show_branded',  via: 'get'

  get "*any", via: :all, to: "errors#not_found" # to capture any request that doesn't match a routing rule above

end
