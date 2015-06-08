Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  match('/', {:via => :get, :to => 'animals#index'})

  resources :animals do
    resources :sightings, only: [:new, :create, :edit, :update, :destroy]
  end

  match('sightings', {:via => :get, :to => 'sightings#show'})
  
  resources :regions
  # match('animals/:animal_id/sightings', {:via => :post, :to => 'sightings#create'})
  # match('animals/:animal_id/sightings/new', {:via => :get, :to => 'sightings#new'})
  # match('animals/:animal_id/sightings/:id/edit',{:via => :get, :to => 'sightings#edit'})
  # match('animals/:animal_id/sightings/:id',{:via => [:patch, :put], :to => 'sightings#update'})
  # match('animals/:animal_id/sightings/:id', {:via => :delete, :to => 'sightings#destroy'})
  #
  # match('regions', {:via => :get, :to => 'regions#index'})
  # match('regions', {:via => :post, :to => 'regions#create'})
  # match('regions/new', {:via => :get, :to => 'regions#new'})
  # match('regions/:id', {:via => :get, :to => 'regions#show'})
  # match('regions/:id/edit', {:via => :get, :to => 'regions#edit'})
  # match('regions/:id', {:via => [:patch, :put], :to => 'regions#update'})
  # match('regions/:id', {:via => :delete, :to => 'regions#destroy'})
  #
  #
  # resources :sightings


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
