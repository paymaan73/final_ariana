Rails.application.routes.draw do
  resources :sections
  resources :clubs
  resources :profiles
  delete 'users/:id', to: 'users#destroy', as: :admin_destroy_user


  devise_for :users, path: 'auth',
    controllers:{
      confirmations: 'confirmations'
  },
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'cmon_let_me_in',
    }

  devise_scope :user do
    delete 'auth/logout', to: 'devise/sessions#destroy'
  end

  root 'pages#home'
  post "section_enroll", to: "user_sections#create"
  post "club_enroll", to: "user_clubs#create"
  delete "club_cancell", to: "user_clubs#destroy"
  delete "section_cancell", to: "user_sections#destroy"
  resources :users, only: %i[index]
end
