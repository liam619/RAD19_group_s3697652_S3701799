Rails.application.routes.draw do

  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # route for like/dislike course
  post   'courses/:id/likecourse',     to: 'likecourses#new', as: 'likecourse'
  post   'courses/:id/dislikecourse',  to: 'dislikecourses#new', as: 'dislikecourse'

  # Handle contact us form
  get '/contacts', to: 'contacts#new'
  post '/contacts', to: 'contacts#create'

  # Handle error and redirect to proper error page
  get '/404', to: 'errors#index', :via => :all
  get '/422', to: 'errors#unprocessable', :via => :all
  get '/500', to: 'errors#internal_server_error', :via => :all

  resources :users, except: [:new, :create]
  resources :courses
  resources :categories
  resources :locations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
