Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => "destroy_user_session_path"
  end

  # Serve up landing page iff the user is not already logged in,
  # otherwise take them to app home.
  authenticated :user do
    root :to => "static_pages#home"
  end
  root :to => "static_pages#index"

  get '/signup', to: 'users#new'

  resources :courses do
    get 'add'
    get 'delete'
    resources :user_course_relations
    resources :comments
    resources :ratings
  end

  get '/fetchcourses', to: 'courses#fetch', defaults: { format: 'js' }
  #get '/add', to: 'courses#add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
