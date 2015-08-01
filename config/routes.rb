Rails.application.routes.draw do
  resources :worksheets
  resources :objectives, only: :destroy
  resources :questions,  only: :destroy

  devise_for :users
  resources :users
  
  resources :curriculums, except: :new do
    resources :topics
  end

  namespace :admin do
    resources :users, only: []  do
      resource :permissions, only: [:edit, :update]
    end
  end

  get 'events/' => 'events#calendar'

  root to: 'landing_pages#home'
end
