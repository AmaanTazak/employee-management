Rails.application.routes.draw do
  
devise_for :users, controllers: {
  sessions: 'users/sessions'
}
  resources :admins, only: [:index, :new, :create, :destroy]
 root "homes#index"
resources :employees do
  resources :attendances, only: [:index, :new, :create]
end
end
