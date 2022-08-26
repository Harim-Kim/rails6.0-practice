Rails.application.routes.draw do
  get 'student/index'
  get 'tutor/index'
  resources :lessons
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :students
  devise_for :tutors
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
