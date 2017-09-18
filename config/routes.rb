Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :sections do
      collection do
        put 'order', to: 'sections#order'
      end
    end
  end
end
