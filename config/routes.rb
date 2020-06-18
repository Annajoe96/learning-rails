Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  post '/result', to: 'home#result'
  get '/contact', to: 'home#contact'
  get '/about', to: 'home#about'

end
