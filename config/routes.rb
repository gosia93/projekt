Rails.application.routes.draw do
  

  resources :search_organisations
  resources :search_volonteers
  get 'registrations/register_voolonteer'

  get 'registrations/register_organisation'

  get 'registrations/register_individual'

  devise_for :users, :controllers => {:registrations => 'registrations'}


  get 'about/index'

  get 'rule/index'

  resources :roles
  resources :organisations
  resources :individuals do
     collection do 
      get :search
      get :auto_complete_search
    end
  end
  resources :volonteers do 
    collection do 
      get :search_by_individual
      get :auto_complete_search
    end
  end
  resources :users
  resources :photos
  resources :volontary_types



   get 'home/index'

  get 'volonteer_home/index' 

  get 'organisation_home/index'

  get 'individual_home/index'

  get 'look_for_volonteer/index'

  scope 'look_for_volonteer' do

    get 'organisation_home/index'

    get 'individual_home/index'

  end


  root to: "home#index"
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
