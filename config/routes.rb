Rails.application.routes.draw do
  devise_for :users 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  resources :contact_us, only: [:new, :create]
  get 'contact_us/thank_you', to: 'contact_us#thank_you'
  get 'about_us', to: 'about_us#index'
  get 'wikipedia_search', to: 'wikipedia_search#index'
  resources :notes do 
    member do
      get 'download'
    end
  end

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
 
end
