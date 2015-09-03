Rails.application.routes.draw do

  mount Mercury::Engine => '/'
  #:path changes name of URL
  #:as creates helper methods for linking
    
  #map controller actions to views
    
    #static_routes routes
  get  'static_routes/index'
  root 'static_routes#index'
  post 'static_routes/mercury_update_index', :as => 'mercury_update_index_page', :path=>"mercury_update_index" 
  post 'staic_routes/mercury_update_classes', :as => 'mercury_update_classes_page', :path=>"mercury_update_classes"
  get  'static_routes/courses', :as => 'courses_page', :path=>"courses"
    
    resources :plays do
        #Member actions are supposed to route to a single record
        #Collection routes to a collection of records
        collection do
            get 'upcoming'#, :as => 'upcoming_plays', :path=>'upcoming_plays'
            get 'archived'#, :as => 'archived_plays',:path =>'archived_plays'
        end
    end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".    
    
  devise_for :users, controllers: { registrations: 'users/registrations'  }
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
