Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  devise_for :customers, skip: [:registrations]
  devise_scope :customer do
    get '/customers/cancel' => 'devise/registrations#cancel', as: :cancel_customer_registration
    get 'custmers/sign_up' => 'devise/registrations#new', as: :new_customer_registration
    post 'customers/sign_up' => 'devise/registrations#create', as: :customer_registration
  end
  # devise_for :customers, skip: :all, controllers: {
  #   sessions:      'public/sessions',
  #   registrations: 'public/registrations'
  # }
  root to: 'public/homes#top'

  namespace :admin do
    resources :genres, only: [:create, :index, :edit, :update]
    resources :items, only: [:create, :index, :edit, :update, :new, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:update, :show]
    get '/' => 'homes#top'
    resources :order_details, only: [:update]
  end


  scope module: 'public' do
    resources :adresses, only: [:create, :index, :edit, :update, :destroy]
    post 'orders/unsubscribe' => 'orders#unsubscribe'
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resource :customers, only: [:update]
    get 'customers/confirm' => 'customers#confirm'
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customer/withdraw' => 'customers#withdraw'
    resources :items, only: [:show, :index]
    get 'top' => 'homes#top'
    get 'about' => 'homes#about'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
