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
  get '/student' => "student#index", :as => :student_root
  post 'student/lesson/:lesson_id' => 'student#enroll', :as => :enroll_lesson
  get 'student/time_tables/:time_table_id/lessons' => 'student#lessons'
  get 'student/time_tables/:time_table_id/lessons_20' => 'student#lessons_20'
  get 'student/time_tables/:time_table_id/lessons_40' => 'student#lessons_40'
  # delete 'stundent/:student_id/lessons/:lesson_id'  => 'student#unenroll'
  get 'student/lesson_20' => 'student#index_20'
  get 'student/lesson_40' => 'student#index_40'
  # get 'student/lessons' => "student#index"
  get '/tutor' => "tutor#index", :as => :tutor_root
  get 'tutor/index'
  get 'tutor/:id/lessons' => "tutor#lessons"
  get '/lessons/new/:time_table_id' => "lessons#new"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :students
  devise_for :tutors
  devise_for :users


  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
