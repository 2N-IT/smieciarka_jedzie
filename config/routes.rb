# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :searches do
      resources :products, only: %i[index]
      post :product_fetch, to: 'searches/product_fetch#create'
    end
  end

  root 'static#home'
end
