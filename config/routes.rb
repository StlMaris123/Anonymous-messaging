Rails.application.routes.draw do
  get 'pages/home'
  resources :messages
  root 'messages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :messages do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
