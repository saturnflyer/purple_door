Rails.application.routes.draw do
  resources :worksheets
  resources :objectives, only: :destroy
  resources :questions,  only: :destroy

  devise_for :users
  namespace :admin do
    resources :users, only: []  do
      resource :permissions, only: [:edit, :update]
    end
  end

  root to: 'landing_pages#home'
  resources :events
  resources :curriculums, except: :new do
    resources :topics
  end
end
