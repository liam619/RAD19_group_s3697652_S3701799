Rails.application.routes.draw do

  root 'static_pages#home'

  #sign up
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  #log in
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # route for like/dislike course
  post 'courses/:id/likecourse', to: 'likecourses#new', as: 'likecourse'
  post 'courses/:id/dislikecourse', to: 'dislikecourses#new', as: 'dislikecourse'
  delete 'courses/:id/rating', to: 'courses#reset', as: 'reset'

  # Handle contact us form
  get '/contacts', to: 'contacts#new'
  post '/contacts', to: 'contacts#create'

  # Handle error and redirect to proper error page
  get '/404', to: 'errors#index', :via => :all, as: :error404
  get '/422', to: 'errors#unprocessable', :via => :all, as: :error422
  get '/500', to: 'errors#internal_server_error', :via => :all, as: :error500

  resources :users
  resources :courses
  resources :categories
  resources :locations

  namespace :api, defaults: {format: :json} do
    resources :api_courses, param: :name, except: [:new, :create, :destroy]
  end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
