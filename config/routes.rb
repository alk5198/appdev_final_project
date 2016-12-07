Rails.application.routes.draw do

  devise_for :users
  devise_for :views
  get "/", :controller => "events", :action => "my_events"
  # Routes for the Event_comment resource:
  # CREATE

  get "/profile", :controller => "users", :action => "profile"

  get "/event_comments/new", :controller => "event_comments", :action => "new"
  post "/create_event_comment", :controller => "event_comments", :action => "create"

  # READ
  get "/event_comments", :controller => "event_comments", :action => "index"
  get "/event_comments/:id", :controller => "event_comments", :action => "show"

  # UPDATE
  get "/event_comments/:id/edit", :controller => "event_comments", :action => "edit"
  post "/update_event_comment/:id", :controller => "event_comments", :action => "update"


  # DELETE
  get "/delete_event_comment/:id", :controller => "event_comments", :action => "destroy"
  #------------------------------

  # Routes for the Tag resource:
  # CREATE
  get "/tags/new", :controller => "tags", :action => "new"
  post "/create_tag", :controller => "tags", :action => "create"

  # READ
  get "/tags", :controller => "tags", :action => "index"
  get "/tags/:id", :controller => "tags", :action => "show"

  # UPDATE
  get "/tags/:id/edit", :controller => "tags", :action => "edit"
  post "/update_tag/:id", :controller => "tags", :action => "update"

  # DELETE
  get "/delete_tag/:id", :controller => "tags", :action => "destroy"
  #------------------------------

  # Routes for the Tagging resource:
  # CREATE
  get "/taggings/new", :controller => "taggings", :action => "new"
  post "/create_tagging", :controller => "taggings", :action => "create"

  # READ
  get "/taggings", :controller => "taggings", :action => "index"
  get "/taggings/:id", :controller => "taggings", :action => "show"

  # UPDATE
  get "/taggings/:id/edit", :controller => "taggings", :action => "edit"
  post "/update_tagging/:id", :controller => "taggings", :action => "update"

  # DELETE
  get "/delete_tagging/:id", :controller => "taggings", :action => "destroy"
  #------------------------------

  # Routes for the Response resource:
  # CREATE
  get "/responses/new", :controller => "responses", :action => "new"
  post "/create_response", :controller => "responses", :action => "create"

  # READ
  get "/responses", :controller => "responses", :action => "index"
  get "/responses/:id", :controller => "responses", :action => "show"

  # UPDATE
  get "/responses/:id/edit", :controller => "responses", :action => "edit"
  post "/update_response/:id", :controller => "responses", :action => "update"

  # DELETE
  get "/delete_response/:id", :controller => "responses", :action => "destroy"
  #------------------------------

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/my_events", :controller => "events", :action => "my_events"
  get "/events/:id", :controller => "events", :action => "show"

  get "/send_simple_message/:id", :controller => "events", :action => "send_simple_message"
  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"
  get "/accept_invite/:id", :controller => "events", :action => "accept"
  get "/reject_invite/:id", :controller => "events", :action => "reject"
  get "/hide_invite/:id", :controller => "events", :action => "hide"
  get "/hide_invite/:id", :controller => "events", :action => "hide"
  get "/back_out_invite/:id", :controller => "events", :action => "back_out"
  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"

  get "/remove_invited/:id/:user_id", :controller => "events", :action => "remove_invited"
  #------------------------------

  # Routes for the User resource:
  # CREATE
  # get "/users/new", :controller => "users", :action => "new"
  # post "/create_user", :controller => "users", :action => "create"

  # READ
  # get "/users", :controller => "users", :action => "index"
  # get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  # get "/users/:id/edit", :controller => "users", :action => "edit"
  # post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  # get "/delete_user/:id", :controller => "users", :action => "destroy"
  #------------------------------

  # Routes for the Friendship resource:
  # CREATE
  get "/friendships/new", :controller => "friendships", :action => "new"
  post "/create_friendship", :controller => "friendships", :action => "create"

  # READ
  get "/friendships", :controller => "friendships", :action => "index"
  get "/friendships/:id", :controller => "friendships", :action => "show"

  # UPDATE
  get "/friendships/:id/edit", :controller => "friendships", :action => "edit"
  post "/update_friendship/:id", :controller => "friendships", :action => "update"
  get "/accept_friendship/:id", :controller => "friendships", :action => "accept"
  # DELETE
  get "/delete_friendship/:id", :controller => "friendships", :action => "destroy"
  #------------------------------





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
