Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :sections
  end
end
