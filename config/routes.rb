Rails.application.routes.draw do
  # Routes for the Watch resource:
  # CREATE
  get '/new_watch' => 'watches#new'
  get '/create_watch' => 'watches#create'

  # READ
  get '/watches' => 'watches#index'
  get '/watches/:id' => 'watches#show'

  # UPDATE
  get '/watches/:id/edit' => 'watches#edit'
  get '/watches/:id/update' => 'watches#update'

  # DELETE
  get '/watches/:id/destroy' => 'watches#destroy'
  #------------------------------

  # Routes for the Movie resource:
  # CREATE
  get '/new_movie' => 'movies#new'
  get '/create_movie' => 'movies#create'

  # READ
  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show'

  # UPDATE
  get '/movies/:id/edit' => 'movies#edit'
  get '/movies/:id/update' => 'movies#update'

  # DELETE
  get '/movies/:id/destroy' => 'movies#destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/new_user' => 'users#new'
  get '/create_user' => 'users#create'

  # READ
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'

  # UPDATE
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/update' => 'users#update'

  # DELETE
  get '/users/:id/destroy' => 'users#destroy'
  #------------------------------
  
  get '/home' => 'home#home'
  get '/greet' => 'pages#home'
  get '/sign_in' => 'pages#sign_in'
  get '/sign_out' => 'pages#sign_out'
  get '/sessions/new' => 'sessions#new'
  get '/sessions/create' => 'sessions#create'
  get '/sessions/destroy' => 'sessions#destroy'
  get '/movie_search' => 'movies#search'
  get '/result' => 'movies#result'
  get '/seenit' => 'movies#seenit'
end
