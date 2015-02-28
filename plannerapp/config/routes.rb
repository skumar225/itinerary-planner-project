Rails.application.routes.draw do
  root 'sites#index'

  resources :plans do
    post '/reviews', to: 'reviews#create'
    delete '/reviews/:id', to: 'reviews#destroy'
  end

  resources :destinations do
    post '/reviews', to: 'reviews#create'
    delete '/reviews/:id', to: 'reviews#destroy'
    resources :companions, shallow: true do
      post '/reviews', to: 'reviews#create'
      delete '/reviews/:id', to: 'reviews#destroy'
    end
  end

=begin
Prefix Verb   URI Pattern                                            Controller#Action
                     root GET    /                                                      sites#index
             plan_reviews POST   /plans/:plan_id/reviews(.:format)                      reviews#create
                          DELETE /plans/:plan_id/reviews/:id(.:format)                  reviews#destroy
                    plans GET    /plans(.:format)                                       plans#index
                          POST   /plans(.:format)                                       plans#create
                 new_plan GET    /plans/new(.:format)                                   plans#new
                edit_plan GET    /plans/:id/edit(.:format)                              plans#edit
                     plan GET    /plans/:id(.:format)                                   plans#show
                          PATCH  /plans/:id(.:format)                                   plans#update
                          PUT    /plans/:id(.:format)                                   plans#update
                          DELETE /plans/:id(.:format)                                   plans#destroy
      destination_reviews POST   /destinations/:destination_id/reviews(.:format)        reviews#create
                          DELETE /destinations/:destination_id/reviews/:id(.:format)    reviews#destroy
        companion_reviews POST   /companions/:companion_id/reviews(.:format)            reviews#create
                          DELETE /companions/:companion_id/reviews/:id(.:format)        reviews#destroy
   destination_companions GET    /destinations/:destination_id/companions(.:format)     companions#index
                          POST   /destinations/:destination_id/companions(.:format)     companions#create
new_destination_companion GET    /destinations/:destination_id/companions/new(.:format) companions#new
           edit_companion GET    /companions/:id/edit(.:format)                         companions#edit
                companion GET    /companions/:id(.:format)                              companions#show
                          PATCH  /companions/:id(.:format)                              companions#update
                          PUT    /companions/:id(.:format)                              companions#update
                          DELETE /companions/:id(.:format)                              companions#destroy
             destinations GET    /destinations(.:format)                                destinations#index
                          POST   /destinations(.:format)                                destinations#create
          new_destination GET    /destinations/new(.:format)                            destinations#new
         edit_destination GET    /destinations/:id/edit(.:format)                       destinations#edit
              destination GET    /destinations/:id(.:format)                            destinations#show
                          PATCH  /destinations/:id(.:format)                            destinations#update
                          PUT    /destinations/:id(.:format)                            destinations#update
                          DELETE /destinations/:id(.:format)                            destinations#destroy
=end

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
