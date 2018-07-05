Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root to: 'home#index'
  get 'dashboard', to: 'home#dashboard'
  resources :group, :only => [:new, :create, :show, :edit, :destroy] do
    resources :payment, :only => [:new, :create, :show, :edit, :destroy] do
      collection do
        get :history
      end
    end
    collection do
      get :list
      get :join
    end
  end
end
