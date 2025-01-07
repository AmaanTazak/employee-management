Rails.application.routes.draw do
 root "employees#index"
resources :employees do
  resources :attendances, only: [:index, :new, :create]
end
end
