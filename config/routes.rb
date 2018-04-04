Unmes::Application.routes.draw do

  get 'payments/pay'
  get 'pages/involve', :as => 'involve' 

  root :to => "pages#cursos"

  resources :courses do
    resources :leads, :only => [:new, :create]
    resources :inscriptions, :only => [:create] do
      collection do 
        get 'pay'
        get 'active'
      end 
    end

    resources :chapters, :only => [:index] do
        resources :workshops, :only => [:show] do
      end
    end

    collection do
      get "my-courses"
    end

 end

  
  get 'home' => 'pages#home'  
  get 'instalar-rails' => 'pages#instalar' 
  get 'calendario' => 'pages#calendario'
  get 'welcome' => 'pages#welcome'
  get 'us' => 'pages#us'
  get 'blog' => 'pages#blog'
  get 'guia' => 'pages#guia'
  
  get 'casos' => 'pages#casos'  

  #Incripción landing principal
  get 'inscripcion' => 'landings#inscripcion'

  #Landings
  get 'programador' => 'landings#programador'
  get 'programador/inscripcion' => 'landings#inscripcion_programador'

  get 'ctostartup' => 'landings#ctostartup'
  get 'ctostartup/inscripcion' => 'landings#inscripcion_ctostartup'

  get 'puc' => 'landings#puc'
  get 'puc/inscripcion' => 'landings#inscripcion_puc'
  get 'rails4designers' => 'landings#rails4designers'

  get 'tupropiaweb' => 'landings#marketingsocial'
  get 'jovenes' => 'landings#jovenes'
 
  #devise_for :users
  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords", omniauth_callbacks: "users/omniauth_callbacks"}, skip: [:sessions, :registrations]  
  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session
    
    get    "signup"  => "users/registrations#new",    as: :new_user_registration
    post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end
  

  get 'users/:id/pay' => 'users#pay', :as => 'user_pay'
  get 'users/active' => 'users#active' 
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  


  


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
