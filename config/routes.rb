Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'

  get '/about_us', to: 'home#about_us'
  get '/contact_us', to: 'home#contact_us'

  resources :user, only: [:index, :destroy, :edit, :courses, :removeCourse]
  resources :faq, only: [:index, :create, :destroy, :update]
  resources :course, only: [:index, :create, :destroy, :update, :register]

  get '/course/register/:course_id/:user_id', to: 'course#register'
  get '/user/courses/:id', to: 'user#courses'
  get '/user/courses/:user_id/:course_id', to: 'user#removeCourse'


end
