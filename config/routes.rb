Sc2rank::Application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :players
  end
  match 'admin' => 'admin/players#index'
  match 'rank/update' => 'rank#update', :via => :put
  root :to => 'rank#index'
end
