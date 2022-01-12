Rails.application.routes.draw do
  resources :articles do
    resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  get 'welcome/index'
  resources :articles 
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
