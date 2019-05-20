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

  resources :users
  resources :courses
  resources :categories
  resources :locations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
