require 'sidekiq/web'
Rails.application.routes.draw do
   mount Sidekiq::Web => '/sidekiq'
  devise_for :users
   root "welcome#index"
   get '/profiles/:user_id/activity', to: 'profiles#activity', as: 'profile_activity'

   resources :categories
   	resources :books do
   		get 'search', on: :collection
   end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
