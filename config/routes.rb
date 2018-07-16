Rails.application.routes.draw do
  resources :books 
  devise_for :users
   root "welcome#index"

   resources :categories
   	resources :books do
   		get 'search', on: :collection
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
