Rails.application.routes.draw do
  root to: 'landing_pages#home'
  devise_for :users
  resources :events, except: [:index, :show]
  resources :curriculums, except: :new do
    resources :topics
  end
  get 'events/' => 'events#calendar'
end
