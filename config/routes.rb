Rails.application.routes.draw do
  resources :lessons
  # resources :tutor do
  #   resources :lessons
  # end
  resources :time_tables
  resources :time_tables do
    resources :lessons
  end
  get 'student/index'
  get 'tutor/index'
  get '/lessons/new/:time_table_id' => "lessons#new"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :students
  devise_for :tutors
  devise_for :users
  get '/tutor' => "tutor#index", :as => :tutor_root
  get '/student' => "student#index", :as => :student_root
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
