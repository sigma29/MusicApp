Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:create,:destroy,:edit,:update, :show] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create,:destroy,:edit,:update, :show]

end
