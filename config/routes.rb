Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  #:path changes name of URL
  #:as creates helper methods for linking
  #path cannot be '''', as it will catch almost all requests, treating URLs are parameters

  root 'editable_pages#index'

  #map controller actions to views :: http://guides.rubyonrails.org/routing.html#crud-verbs-and-actions
  resources :editable_pages, :path => 'content', :except => [:show, :new] do
      collection do
          put 'mercury_update_index'
          put 'mercury_update_courses'
          get 'courses'
      end
  end

  devise_for :users

  resources :plays, :except => [:index] do
      collection do
          get 'upcoming'
          get 'archived'
      end
      member do
        get :download_all_pics
      end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
