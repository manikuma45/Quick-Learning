Rails.application.routes.draw do
  get 'parts/index'
  get 'parts/new'
  get 'parts/show'
  get 'parts/edit'
  devise_scope :user do
    root "users/sessions#new"
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  resources :admins, only: [:show]
end
