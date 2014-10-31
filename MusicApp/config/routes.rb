MusicApp::Application.routes.draw do
  resource :session, only: [:create, :new, :destroy]
  resources :users, only:[:create, :new]
  
  root to: redirect("/users")
end
