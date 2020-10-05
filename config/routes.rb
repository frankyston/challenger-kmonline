Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'enquetes' => "poll#index", as: :polls
  get "enquete/:id" => "poll#show", as: :poll
  post "enquete/:id/enviar" => "poll#create", as: :send_poll_answer

  namespace :admin, path: '/admin' do
    root 'home#index'
    resources :surveys
  end
end
