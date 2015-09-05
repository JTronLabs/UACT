Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  #:path changes name of URL
  #:as creates helper methods for linking
    
  #map controller actions to views    
    resources :editable_pages do
        member do
            put 'mercury_update_index'
        end
        collection do
            put 'mercury_update_courses'
            get 'courses'
        end
    end
    
  root 'editable_pages#index'
    
    resources :plays do
        collection do
            get 'upcoming'
            get 'archived'
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
