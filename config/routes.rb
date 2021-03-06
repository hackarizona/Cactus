Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:registrations => 'users/registrations',
                                      :sessions      => 'users/sessions',
                                      :confirmations => 'users/confirmations',
                                      :passwords     => 'users/passwords',
                                      :unlocks       => 'users/unlocks',
                                      :invitations   => 'users/invitations'}
  root to: "home#index"
  resources :notifications
  resources :forms
  resources :users
  get 'dashboard' => 'dashboard#index'
  get 'dashboard/events' => 'dashboard#events', as: :events
  get 'dashboard/profile' => 'dashboard#profile', as: :profile
  post'dashboard/profile' => 'dashboard#profile', as: :update_profile
  get 'dashboard/applications/new' => 'dashboard#form', as: :new_submission
  get 'dashboard/applications' => 'dashboard#available_forms', as: :submissions





devise_scope :user do
  get 'login' => 'users/sessions#new'
  get 'logout' => 'users/sessions#destroy'
  get 'signup' => 'users/registrations#new'
  get 'invites/new' => 'users/registrations#new', as: :new_registration

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
