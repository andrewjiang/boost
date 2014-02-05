Zephyr::Application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :car_listings,        only: [:new, :create, :destroy]
  resources :driver_applications, only: [:new, :create, :destroy]
  resources :car_slots,           only: [:update]

  root 'home#index'
  match '/list',            to: 'car_listings#new',              via: 'get'
  match '/list_submitted',  to: 'car_listings#submitted',        via: 'get'
  match '/drive',           to: 'driver_applications#new',       via: 'get'
  match '/drive_submitted', to: 'driver_applications#submitted', via: 'get'
  match '/dashboard',       to: 'dashboard#show',                via: 'get'
  match '/schedule',        to: 'schedule#show',                 via: 'get'
  match '/profile',         to: 'profile#show',                  via: 'get'

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

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
