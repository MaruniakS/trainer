Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Route for exercises in muscle groups
  get 'exercises/group/:id' => 'exercises#group', as: 'exercises_group'

  # Personal office
  #get 'users/:id/personal' => 'users#personal', as: 'personal'

  # User programs
  #get 'users/:id/programs' => 'programs#programs', as: 'user_programs'
  #get 'users/:id/programs/:id' => 'programs#program', as: 'user_program'
  #get 'users/:id/programs/:id/edit' => 'programs#edit', as: 'edit_program'

  # Programs filter
  get 'programs/filter' => 'programs#filter', as: 'program_filter'

  # Add program
  get 'programs/assign_to_user' => 'programs#assign_to_user', as: 'assign_program'

  # All programs
  get '/programs' => 'programs#all_programs', as: 'all_programs'

  # Single program
  get '/programs/:id' => 'programs#common_program', as: 'common_program'

  # Generate individual program
  get '/individual' => 'programs#individual', as: 'individual_program'
  post '/create_individual' => 'programs#create_individual', as: 'create_individual_program'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :exercises, only: [:index, :show]
  resources :users, only: [:show] do
    resources :programs, controller: 'programs', as: 'training_programs'
    resources :parameters, controller: 'parameters'
    resources :events, controller: 'events'
  end

  # Edit program
  # Add exercise
  get 'training_days/:id/edit' => 'training_days#edit', as: 'edit_training_day'

  # Edit exercise
  get 'training_days/:id/change_exercise' => 'training_days#change_exercise', as: 'change_exercise'

  # Delete exercise from training day
  delete 'training_days/:id/delete_exercise' => 'training_days#delete_exercise', as: 'delete_exercise'

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
