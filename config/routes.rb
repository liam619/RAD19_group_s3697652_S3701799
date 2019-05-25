Rails.application.routes.draw do

  root 'static_pages#home'

  #sign up
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  #log in
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  #location
  #get '/locations', to: 'locations#new'
  #post '/locations', to: 'locations#create'

  # route for like/dislike course
  post 'courses/:id/likecourse', to: 'likecourses#new', as: 'likecourse'
  post 'courses/:id/dislikecourse', to: 'dislikecourses#new', as: 'dislikecourse'
  delete 'courses/:id/rating', to: 'courses#reset', as: 'reset'

  # Handle contact us form
  get '/contacts', to: 'contacts#new'
  post '/contacts', to: 'contacts#create'

  # Handle error and redirect to proper error page
  get '/404', to: 'errors#index', :via => :all
  get '/422', to: 'errors#unprocessable', :via => :all
  get '/500', to: 'errors#internal_server_error', :via => :all

  resources :users#, except: [:new, :create]
  resources :courses
  resources :categories
  resources :locations
  resources :contacts, except: [:destroy, :patch, :update]
  #resources :errors

  namespace :api, defaults: {format: :json} do
    resources :api_courses, param: :name, except: [:new, :create, :destroy]
  end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
