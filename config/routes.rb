Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /fr|en|it/ do
    get 'mentionslegales', to: 'pages#mentionslegales', as: 'mentionslegales'
    get 'services', to: 'pages#services', as: :services
    get 'realisations', to: 'pages#realisations', as: :realisations
    get 'contact', to: 'contacts#new', as: :contacts
    post 'contact', to: 'contacts#create'
    root to: 'pages#home'
  end
end
