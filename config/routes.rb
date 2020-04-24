Rails.application.routes.draw do
  # LetterOpenerWebの設定
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_scope :admin do
    root "projects#introduction"
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations',
    invitations: 'admins/invitations',
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :users, only: [:show]
  resources :admins, only: [:show]

  resources :projects do
    get :introduction, on: :collection
    get :project_launch, on: :member
    resources :subjects do
      resources :parts do
        patch :toggle_status
        resources :questions, only: [:new, :show, :update, :create, :edit, :destroy]
      end
    end
  end
  resources :questions, only: [:user_question, :index] do
    get :user_question, on: :collection
  end
  resources :project_users, only: [:create, :destroy]
  resources :project_admins, only: [:create, :destroy]
end
