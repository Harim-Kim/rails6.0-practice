Rails.application.routes.draw do
  resources :lessons
  # resources :tutor do
  #   resources :lessons
  # end
  resources :time_tables
  # resources :time_tables do
  #   resources :lessons
  # end
  get 'time_tables/:time_table_id/lessons' => "time_tables#lessons"
  get 'student/index'
  get 'tutor/index'
  get 'tutor/:id/lessons' => "tutor#lessons"
  get 'student/:student_id/lessons/:lesson_id' => 'student#enroll'
  delete 'stundent/:student_id/lessons/:lesson_id'  => 'student#unenroll'
  get 'student/lesson_20' => 'student#lesson_20'
  get 'student/lesson_40' => 'student#lesson_40'
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
