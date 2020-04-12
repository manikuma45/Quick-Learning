Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

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
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :users, only: [:show]
  resources :admins, only: [:show]
  resources :parts
  resources :subjects
  resources :projects
  resources :questions
end
