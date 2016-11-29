Rails.application.routes.draw do

  get 'pages/homepage'

  get 'pages/about'

  #get 'sessions/new'


  resources :sessions
  resources :foods
  resources :application

  resources :users do
    resources :entries, :path => "diary"
  end

  post "log_in" => "sessions#create", :as => "log_in"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"

  get "signup" => "users#new", :as => "signup"

  get "edit_macros" => "users#edit_macros", :as => "edit_macros"

  get "about" => "pages#about", :as => "about"

  get "entry/:id/edit" => "entries#edit", :as => "edit_entry"

  patch "update_macros" => "users#updt_macros", :as => "update_macros"

  patch "update_entry" => "entries#update", :as => "update_entry"

  post "create_entry/:food_id" => "entries#create", :as => "create_entry"
  get "entries" => "entries#index", :as => "diary"
  get "new_entry/:food_id" => "entries#new", :as => "new_entry"

  delete "clear_day/" => "entries#clear_day", :as => "clear_day"
  delete "clear_week/" => "entries#clear_week", :as => "clear_week"
  # get "foods" => "foods#index", :as => "foodlist"

  #get "users/:id/edit" => "users#edit", :as => "edit"

  get "homepage" => 'pages#homepage', :as => "homepage"

  delete "remove_entry/:id" => "entries#destroy", :as => "remove_entry"

  match 'diary', to: 'entries#index', via: :all
  match 'edit', to: 'users#edit', via: :all
  #match 'homepage', to: 'app#homepage'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'users#index'
  root :to => 'pages#homepage'

  # root :to => "foods#index", :id => 3

  get "app/views/users/profile.html.erb", to: "users#profile", :as =>  "profile"

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
