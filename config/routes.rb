Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /fr|en|it/ do
    get 'services', to: 'pages#services', as: :services
    get 'realisations', to: 'pages#realisations', as: :realisations
    get 'nouscontacter', to: 'pages#nouscontacter', as: :contacts
    get 'contact', to: 'contact#new', as: :contact
    post 'contact', to: 'contact#create'
    root to: 'pages#home'
  end
end
