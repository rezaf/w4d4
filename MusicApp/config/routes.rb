MusicApp::Application.routes.draw do
  resource :session, only: :create, as: :session
  resources :session, only:[:new, :destroy]
  resources :users, only:[:create, :new]
  
  root to: 'users#new'
end
