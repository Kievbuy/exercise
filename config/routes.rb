Rails.application.routes.draw do
  namespace :v1 do
    resources :articles
    post 'authenticate', to: 'authentication#authenticate'
  end
end
