Rails.application.routes.draw do

  resources :worksheets do
    resources :user_worksheets
  end

  resources :objectives, only: :destroy
  resources :questions,  only: :destroy

  devise_for :users
  resources :users

  namespace :admin do
    resources :users, only: []  do
      resource :permissions, only: [:edit, :update]
    end
  end

  resources :events, except: [:new]

  resources :curriculums, except: :new do
    resources :topics do
      resources :documents, except: :index
    end
  end

  root to: 'landing_pages#home'
end
