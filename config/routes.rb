Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'

  get '/about_me', to: 'home#about_me'
  get '/faq', to: 'home#faq'

end
