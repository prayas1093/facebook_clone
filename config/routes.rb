Rails.application.routes.draw do

  authenticated :user do
    root "timeline#get_timeline", as: "authenticated_root"
  end

  root 'home#index'

  devise_for :users, controllers: {sessions: 'users/sessions', passwords: 'users/passwords', confirmations: 'users/confirmations',registrations: 'users/registrations', unlocks: 'users/unlocks'}
  
  resource :posts
  
  get '/autocomplete_user_email' => 'timeline#autocomplete_user_email'
  post '/create_post_remote' =>'post#create_post_remote'  
  get '/like_post_remote' =>'like#like_post_remote'
  get '/users' => 'follow#get_all_users'
  get '/follow' => 'follow#follow'
  get '/user_profile' => 'profile#show'
  get '/edit/:username' => 'profile#edit', as: 'edit_profile'



end
