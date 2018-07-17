Rails.application.routes.draw do
  get 'categories/new'
  get 'categories/create'
  get 'categories/update'
  get 'categories/edit'
  get 'categories/destroy'
  get 'categories/index'
  get 'categories/show'
  resources :books 
  devise_for :users
   root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
