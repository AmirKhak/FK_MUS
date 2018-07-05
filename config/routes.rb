Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'

  get '/about_us', to: 'home#about_us'
  get '/contact_us', to: 'home#contact_us'
  get '/faq', to: 'home#faq'

end
